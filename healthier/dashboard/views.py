import random
from django.core import serializers
from django.db import IntegrityError
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, render_to_response
from django.urls import reverse
from django.views.generic import DetailView, FormView, ListView, TemplateView
from django_messages.models import Message
from django.contrib import messages
from django.core.files.storage import FileSystemStorage
from healthier.consumers.models import Consumer
from healthier.dashboard.forms import AccountDetailForm, ServiceRequestConfigurationForm
from healthier.providers.models import Provider, Promo
from healthier.service.models import HealthierService, ServiceRequests, OrderedService, SuggestService, ServiceReport
from healthier.user.models import HealthierUser, Family, HealthierUserAilmentData, HealthierUserClinicalData, \
    HealthierUserBloodData, HealthierUserMiscData


class DashboardView(TemplateView):
    provider_dashboard = "dashboard/provider/provider_index.html"
    consumer_dashboard = "dashboard/consumer/consumer_index.html"
    context = {'current_page_title': 'Dashboard'}

    def get(self, request, **kwargs):
        storage = messages.get_messages(request)
        storage.used = True
        self.context['rand_today'] = random.randint(0, 5)
        self.context['rand_month'] = random.randint(0, 5)
        user_specific_template = self.provider_dashboard if request.user.account_type == "PRO" else \
            self.consumer_dashboard
        if request.user.account_type == "PRO":
            orders = OrderedService.objects.filter(provided_by__healthier_id_id=self.request.user.id).distinct()
            self.context['customer_count'] = len(set(orders))
            self.context["provider_services"] = ServiceRequests.objects.filter(
                requested_by__healthier_id=request.user.id)
        self.context['consumer_services'] = OrderedService.objects.filter(ordered_by__healthier_id_id=request.user.id
                                                                          , payment_status=True)
        orders = self.context['consumer_services'].distinct()
        self.context['services_count'] = len(set(orders))
        try:
            self.context['inbox'] = Message.objects.filter(recipient=request.user.id)[3]
        except IndexError:
            self.context['inbox'] = Message.objects.filter(recipient=request.user.id)
        if not request.user.has_configured_account:
            response_obj = HttpResponseRedirect(reverse("dashboard:account_settings"))
            response_obj.delete_cookie('messages')
            return response_obj
        response_obj = render(request, user_specific_template, self.context)
        response_obj.delete_cookie('messages')
        return response_obj


class FinancesView(TemplateView):
    template_name = "dashboard/finances/index.html"

    def get(self, request, **kwargs):
        return render(request, self.template_name)


class OrderListView(TemplateView):
    template_name = 'dashboard/consumer/orders.html'
    detail_template_name = 'dashboard/consumer/consumer_detail.html'
    context_object_name = 'orders'
    model = Consumer
    context = {}

    def get(self, request, *args, **kwargs):
        self.context['has_tables'] = 'True'
        self.context['current_page_title'] = 'Orders'
        self.context['orders'] = OrderedService.objects.filter(provided_by__healthier_id_id=self.request.user.id)
        action = self.request.GET.get('action')
        order_id = self.request.GET.get('order')
        if action == 'confirm':
            response_obj = HttpResponseRedirect(reverse('dashboard:consumer'))
            order = OrderedService.objects.get(id=order_id)
            order.confirmed = True
            response_obj.set_cookie('status', True)
            response_obj.set_cookie('message', "The order has been successfully confirmed")
            return response_obj
        elif action == 'sendMessage':
            return HttpResponseRedirect(reverse('dashboard:compose_message'))
        elif action == "block":
            response_obj = HttpResponseRedirect(reverse('dashboard:consumer'))
            order = OrderedService.objects.get(id=order_id)
            order.is_active = False
            order.save()
            response_obj.set_cookie('status', True)
            response_obj.set_cookie('message', "The order has been blocked.")
            return response_obj
        return render(request, self.template_name, self.context)

    def get_context_data(self, **kwargs):
        super(OrderListView, self).__init__()
        context = super(OrderListView, self).get_context_data(**kwargs)
        context['has_tables'] = 'True'
        context['current_page_title'] = 'Orders'
        return context


class UserServicesListView(ListView):
    template_name = "dashboard/services/my_services.html"
    model = Provider

    def get_context_data(self, **kwargs):
        super(UserServicesListView, self).__init__()
        context = super(UserServicesListView, self).get_context_data(**kwargs)
        user_details = Provider.objects.get(healthier_id=self.request.user.id) \
            if self.request.user.account_type == "PRO" else Consumer.objects.get(healthier_id=self.request.user.id)
        context['current_page_title'] = "My Services"
        context['user_services'] = ServiceRequests.objects.filter(
            requested_by_id=user_details.id) if self.request.user.account_type == "PRO" \
            else OrderedService.objects.filter(ordered_by__healthier_id_id=self.request.user.id, payment_status=True)
        context["all_services"] = HealthierService.objects.all()
        return context


class ServiceDetailView(DetailView):
    template_name = "dashboard/services/service.html"
    model = HealthierService
    context_object_name = "service"

    def get_object(self, queryset=None):
        return HealthierService.objects.get(id=self.kwargs["service_id"])

    def get_context_data(self, **kwargs):
        context = super(ServiceDetailView, self).get_context_data(**kwargs)
        service_details = HealthierService.objects.get(id=self.kwargs["service_id"])
        HealthierService.objects.filter(id=self.kwargs["service_id"]).update(views=int(service_details.views) + 1)
        context["service"] = HealthierService.objects.get(id=self.kwargs["service_id"])
        context["providers"] = ServiceRequests.objects.filter(service_id=self.kwargs["service_id"])
        return context


class AllServiceListView(ListView):
    template_name = "dashboard/services/all_services.html"
    context_object_name = "all_services"
    paginate_by = 9

    def get_queryset(self):
        not_rendered_services = HealthierService.objects.exclude(
            servicerequests__requested_by__healthier_id=self.request.user.id)
        all_services = HealthierService.objects.all()
        queryset = not_rendered_services if self.request.user.account_type == "PRO" else all_services
        return queryset

    def get_context_data(self, **kwargs):
        super(AllServiceListView, self).__init__()
        context = super(AllServiceListView, self).get_context_data(**kwargs)
        context["current_page_title"] = "All services"
        # @Todo: I did this on purpose: Would fix it eventually.
        context["providers"] = Provider.objects.all()
        context['random_spinner'] = range(100)
        context["has_modal"] = True
        return context


class SuggestServiceView(TemplateView):
    template_name = "dashboard/services/suggest_new_service.html"
    context = {}

    def get(self, request, *args, **kwargs):
        self.context["current_page_title"] = "New Service Suggestion"
        return render(request, self.template_name, self.context)

    def post(self, request):
        form_response = request.POST.dict()
        form_response.pop('csrfmiddlewaretoken')
        suggested_service = SuggestService(**form_response)
        suggested_service.save()
        response_obj = HttpResponseRedirect(reverse("dashboard:dashboard"))
        response_obj.set_cookie('status', True)
        response_obj.set_cookie('message', "Your service suggestion has been notified")
        return response_obj


class BaseSettingsView(FormView):
    def __init__(self, context_data=None, **kwargs):
        super(BaseSettingsView, self).__init__(**kwargs)
        self.context_data = context_data

    def get_context_data(self, **kwargs):
        context = super(BaseSettingsView, self).get_context_data(**kwargs)
        for key, value in self.context_data.items():
            context[key] = value
        return context

    def form_valid(self, form):
        healthier_user_id = form.cleaned_data["id"]
        healthier_user = self.form_class.objects.get(request=healthier_user_id)
        return HttpResponse(healthier_user)

    def form_invalid(self, form):
        return HttpResponse("What?")


class AccountSettingsView(TemplateView):
    context_data = {}
    template_name = "dashboard/settings/account_settings.html"
    form_class = AccountDetailForm

    def get(self, request, *args, **kwargs):
        self.context_data["current_page_title"] = "Account Settings"
        return render(request, self.template_name, self.context_data)

    def post(self, request):
        response_data = request.POST.dict()
        response_data.pop('csrfmiddlewaretoken')
        response_data["has_configured_account"] = True
        user_email = request.user.email
        attempt_update = HealthierUser.objects.filter(email=user_email).update(**response_data)
        response_obj = HttpResponseRedirect(reverse('dashboard:dashboard'))
        if attempt_update:
            if request.FILES.get('image', None):
                image = request.FILES['image']
                fs = FileSystemStorage()
                image_storage = fs.save(image.name, image)
                HealthierUser.objects.filter(email=user_email).update(image=fs.url(image_storage))
                return response_obj
            response_obj.set_cookie('status', True)
            response_obj.set_cookie('message', "Your account has been successfully updated")
            return response_obj
        return HttpResponseRedirect(reverse('dashboard:dashboard'))


class FinanceSettingsView(TemplateView):
    context_data = {}
    template_name = "dashboard/settings/finance_setting.html"
    form_class = AccountDetailForm

    def get(self, request, *args, **kwargs):
        self.context_data["current_page_title"] = "Finance Settings"
        self.context_data['keep_page_title'] = False
        return render(request, self.template_name, self.context_data)

    def post(self, request):
        response_data = request.POST.dict()
        response_data.pop('csrfmiddlewaretoken')
        response_data["has_configured_account"] = True
        user_email = request.user.email
        HealthierUser.objects.filter(email=user_email).update(**response_data)
        response_obj = HttpResponseRedirect(reverse('dashboard:dashboard'))
        response_obj.set_cookie('status', True)
        response_obj.set_cookie('message', "Your account has been successfully updated")
        return response_obj


class ServiceSettingsView(TemplateView):
    context_data = {}
    template_name = "dashboard/settings/service_setting.html"
    form_class = AccountDetailForm

    def get(self, request, *args, **kwargs):
        self.context_data["current_page_title"] = "Service Settings"
        return render(request, self.template_name, self.context_data)

    def post(self, request):
        response_data = request.POST.dict()
        response_data.pop('csrfmiddlewaretoken')
        response_data["has_configured_account"] = True
        user_email = request.user.email
        HealthierUser.objects.filter(email=user_email).update(**response_data)
        response_obj = HttpResponseRedirect(reverse('dashboard:dashboard'))
        response_obj.set_cookie('status', True)
        response_obj.set_cookie('message', "Your account has been successfully updated")
        return response_obj


class OrderCheckoutView(TemplateView):
    template_name = 'dashboard/services/checkout_cart.html'
    context = {}

    def get(self, request, **kwargs):
        self.context['current_page_title'] = "Checkout Service"
        self.context['keep_page_title'] = True
        self.context['service_details'] = OrderedService.objects.filter(ordered_by__healthier_id_id=request.user.id,
                                                                        payment_status=False)
        members_count = [len(i.members) for i in self.context['service_details']]
        total = set([i.price.gross * (a + 1) for a in members_count for i in self.context['service_details']])
        self.context['members_count'] = members_count
        self.context['total'] = total
        self.context['price_sum'] = sum(total)
        self.context['request'] = request
        response = render_to_response(self.template_name,
                                      self.context)
        service_ids = [i.order_id for i in self.context.get('service_details')]
        request.session['order_ids'] = service_ids
        return response


class OrderServiceStepView(TemplateView):
    template_name = ''
    context = {}

    def get(self, request, *args, **kwargs):
        action = self.kwargs.get('action')
        service_id = request.GET.get('service')
        self.context['service'] = HealthierService.objects.get(id=service_id)
        if request.user.account_type != "CON":
            response_obj = HttpResponseRedirect(reverse('account_logout'))
            response_obj.set_cookie('status', "error")
            response_obj.set_cookie('message', "You need a consumer account to access this page.")
            return response_obj
        consumer_details = Consumer.objects.get(healthier_id_id=request.user.id)
        if action == "chooseProvider":
            self.template_name = 'dashboard/provider/select_provider.html'
            self.context['current_page_title'] = 'Choose a provider for the "{}" service'.format(
                self.context['service'].service_name)
            service_providers = ServiceRequests.objects.filter(service_id=service_id)
            if not service_providers:
                self.context['all_services'] = HealthierService.objects.all()
            self.context['service_providers'] = service_providers
            return render(request, self.template_name, self.context)
        elif action == "configureCheckout":
            self.template_name = 'dashboard/provider/configure_checkout.html'
            self.context['current_page_title'] = 'Configure the "{}" service for checkout'.format(
                self.context['service'].service_name)
            self.context['keep_page_title'] = False
            self.context['family_members'] = Family.objects.filter(head=self.request.user.id)
            self.context['service_details'] = ServiceRequests.objects.get(service_id=service_id)
            return render(request, self.template_name, self.context)
        elif action == "removeService":
            OrderedService.objects.filter(ordered_by=consumer_details.id, service_id=service_id).delete()
            return HttpResponseRedirect(reverse('dashboard:order_service'))
        elif action == "confirmRenew":
            service_details = OrderedService.objects.get(ordered_by=consumer_details.id, service_id=service_id)
            if service_details.is_active:
                response_obj = HttpResponseRedirect(reverse('dashboard:dashboard'))
                response_obj.set_cookie('status', "error")
                response_obj.set_cookie('message', "The current order has not ended.")
                return response_obj
            return HttpResponseRedirect(reverse('dashboard:order_service_step', "configureCheckout",
                                                kwargs={'service': service_id, 'provider': request.user.id}))

    def post(self, request, action):
        response = request.POST.dict()
        response.pop('csrfmiddlewaretoken')
        members = request.POST.getlist('members')
        try:
            response.pop('members')
        except KeyError:
            pass
        service_id = request.GET.get('service')
        provider_id = request.GET.get('provider')
        service_request_details = ServiceRequests.objects.get(service_id=service_id)
        service_details = HealthierService.objects.get(id=service_id)
        provider_details = Provider.objects.get(healthier_id_id=provider_id)
        consumer_details = Consumer.objects.get(healthier_id=request.user.id)
        try:
            OrderedService(ordered_by=consumer_details, service=service_details, provided_by=provider_details,
                           price=service_request_details.price,
                           **response, members=members).save()
            consumer = HealthierUser.objects.get(id=request.user.id)
            provider = HealthierUser.objects.get(id=provider_id)
            HealthierService.objects.filter(id=service_id).update(
                orders=int(service_request_details.service.orders) + 1,
                views=int(service_request_details.service.views) + 1)
            consumer.total_money += service_request_details.price
            provider.total_money += service_request_details.price
            consumer.save(), provider.save()
            return HttpResponseRedirect(reverse('dashboard:order_service'))
        except IntegrityError:
            response_obj = HttpResponseRedirect(reverse('dashboard:dashboard_my_services'))
            response_obj.set_cookie('status', True)
            response_obj.set_cookie('message', "The service already exists in your cart.")
            return response_obj


class ProfileView(TemplateView):
    def get(self, request, *args, **kwargs):
        return HttpResponse("I got here")


class OrderServiceConfigurationView(TemplateView):
    template_name = "dashboard/services/render_service.html"
    form_class = ServiceRequestConfigurationForm

    def get(self, request, *args, **kwargs):
        service_id = kwargs.get('pk', None)
        print(service_id)
        if not service_id:
            response_obj = HttpResponseRedirect(reverse('dashboard:dashboard_all_services'))
            response_obj.set_cookie('status', "error")
            response_obj.set_cookie('message', "There is currently no provider for this service")
            return response_obj
        service_details = HealthierService.objects.get(id=service_id)
        return render(request, self.template_name,
                      {'service_details': service_details, 'form': self.form_class,
                       'current_page_title': "Service Configuration"})

    def post(self, request, **kwargs):
        response = request.POST.dict()
        response.pop('csrfmiddlewaretoken')
        user_id = Provider.objects.get(healthier_id=request.user.id)
        service_id = kwargs.get('pk')
        requested_service = ServiceRequests(is_ordered=True, requested_by=user_id, service_id=service_id, **response)
        requested_service.save()
        response_obj = HttpResponseRedirect(reverse('dashboard:dashboard_my_services'))
        response_obj.set_cookie('status', True)
        response_obj.set_cookie('message', "You have successfully added a new service.")
        return response_obj


class AllProviderListView(ListView):
    template_name = "dashboard/services/all_services.html"
    context_object_name = "all_services"
    queryset = Provider.objects.all()


class ProviderDetailView(DetailView):
    template_name = "dashboard/provider/provider_details.html"
    context_object_name = "provider_details"

    def get_queryset(self):
        return HealthierUser.objects.filter(id=self.kwargs["pk"])

    def get_context_data(self, **kwargs):
        context = super(ProviderDetailView, self).get_context_data(**kwargs)
        context["services"] = ServiceRequests.objects.filter(requested_by_id=self.kwargs["pk"])
        return context


class AllServiceReportView(ListView):
    template_name = 'dashboard/services/report.html'
    queryset = ServiceReport.objects.all()
    context_object_name = "reports"

    def get_context_data(self, **kwargs):
        context = super(AllServiceReportView, self).get_context_data(**kwargs)
        context['current_page_title'] = "Report List"
        return context


class ReportDetailsView(DetailView):
    template_name = "dashboard/services/report_detail.html"
    context_object_name = "report_detail"

    def get_queryset(self):
        return ServiceReport.objects.filter(id=self.kwargs["pk"])

    def get_context_data(self, **kwargs):
        context = super(ReportDetailsView, self).get_context_data(**kwargs)
        context["services"] = ServiceRequests.objects.filter(requested_by_id=self.kwargs["pk"])
        return context


class GenerateReportView(TemplateView):
    template_name = 'dashboard/services/generate_report.html'
    context = {}

    def get(self, request, *args, **kwargs):
        self.context['current_page_title'] = "Generate Report"
        order_id = self.request.GET.get('order')
        request.session['order_id'] = order_id
        return render(request, self.template_name,
                      self.context)

    def post(self, request):
        response_data = request.POST.dict()
        fs = FileSystemStorage()
        response_data.pop('csrfmiddlewaretoken')
        order_id = request.session.get('order_id')
        gen_for = OrderedService.objects.get(id=order_id)
        ServiceReport(**response_data, generated_for=gen_for).save() if not request.FILES.get(
            'report_file') \
            else ServiceReport(**response_data, generated_for=gen_for, report_file=
            fs.url(fs.save(request.FILES['report_file'].name,
                       request.FILES['report_file']))).save()
        response_obj = HttpResponseRedirect(reverse('dashboard:service_report'))
        response_obj.set_cookie('status', True)
        response_obj.set_cookie('message', "The report has been successfully generated.")
        return response_obj


class UserFamilyListView(ListView):
    template_name = "dashboard/family/family_list.html"
    context_object_name = "all_services"
    model = Family

    def get_context_data(self, **kwargs):
        super(UserFamilyListView, self).__init__()
        context = super(UserFamilyListView, self).get_context_data(**kwargs)
        context['current_page_title'] = "My Family"
        context['has_modal'] = True
        context['family_members'] = Family.objects.filter(head=self.request.user.id, active=True)
        return context


class AddFamilyView(TemplateView):
    template_name = "dashboard/family/add_member.html"
    context = {}

    def get(self, request, **kwargs):
        return render(request, self.template_name,
                      self.context)

    def post(self, request):
        response = request.POST.dict()
        response.pop('csrfmiddlewaretoken')
        user_id = HealthierUser.objects.get(id=request.user.id)
        member = Family(head=user_id, **response)
        member.save()
        response_obj = HttpResponseRedirect(reverse('dashboard:family'))
        response_obj.set_cookie('status', True)
        response_obj.set_cookie('message', "New Family Member Added.")
        return response_obj


def remove_family(request, member_id):
    Family.objects.filter(head=request.user, id=member_id).update(active=False)
    response_obj = HttpResponseRedirect(reverse('dashboard:family'))
    response_obj.set_cookie('status', True)
    response_obj.set_cookie('message', "Family successfully removed.")
    return response_obj


class FailedPaymentView(TemplateView):
    pass


class SuccessPaymentView(TemplateView):
    template_name = 'dashboard/consumer/success_billing.html'
    context = {}

    def get(self, request, *args, **kwargs):
        self.context['current_page_title'] = "Payments"
        self.context['request'] = request
        response = render_to_response(self.template_name, self.context)
        order_ids = request.session.get('order_ids')
        for order_id in order_ids:
            print(request.user.id)
            service = OrderedService.objects.get(ordered_by=request.user.id, order_id=order_id)
            service.payment_status = True
            service.save()
            request.session['order_ids'] = []
        self.context['paid_services'] = OrderedService.objects.filter(ordered_by__healthier_id_id=request.user.id,
                                                                      payment_status=True)
        if order_ids:
            response.set_cookie('status', True)
            response.set_cookie('message', "Your payment was successful.")
        return response


class HealthDataUpload(TemplateView):
    template_name = 'dashboard/consumer/health_info.html'

    def get_context_data(self, **kwargs):
        super(HealthDataUpload, self).__init__()
        context = super(HealthDataUpload, self).get_context_data(**kwargs)
        context['current_page_title'] = "Health Data"
        return context

    def post(self, request, *args, **kwargs):
        response = request.POST.dict()
        response.pop('csrfmiddlewaretoken')
        data_map = {'clinic_detail': HealthierUserClinicalData, 'blood_detail': HealthierUserBloodData,
                    'ailment_detail': HealthierUserAilmentData, 'misc_detail': HealthierUserMiscData}
        save_data_for = request.GET.get('save_for')
        data_class = data_map.get(save_data_for)
        data_class(user=request.user, **response).save()
        response_obj = HttpResponseRedirect(reverse('dashboard:view_health_info'))
        response_obj.set_cookie('status', True)
        response_obj.set_cookie('message', "Data successfully saved")
        return response_obj


class HealthDataView(TemplateView):
    template_name = 'dashboard/consumer/health_info_view.html'

    def get_context_data(self, **kwargs):
        super(HealthDataView, self).__init__()
        context = super(HealthDataView, self).get_context_data(**kwargs)
        context['current_page_title'] = "Health Data"
        context['has_chart'] = True
        context['clinical_detail'] = HealthierUserClinicalData.objects.filter(user=self.request.user)
        context['blood_detail'] = serializers.serialize('json',
                                                        HealthierUserBloodData.objects.filter(user=self.request.user))
        context['ailment_detail'] = HealthierUserAilmentData.objects.filter(user=self.request.user)
        context['misc_detail'] = HealthierUserMiscData.objects.filter(user=self.request.user)
        return context


class PromoListView(ListView):
    template_name = "dashboard/provider/promo.html"
    context_object_name = "promo_list"

    def get_queryset(self):
        provider_details = Provider.objects.get(healthier_id_id=self.request.user.id)
        return Promo.objects.filter(promo_provider=provider_details.id, active=True)

    def get_context_data(self, **kwargs):
        super(PromoListView, self).__init__()
        context = super(PromoListView, self).get_context_data(**kwargs)
        context['current_page_title'] = "Promo List View"
        return context


class PromoCreateView(TemplateView):
    template_name = 'dashboard/provider/create_promo.html'

    def get_context_data(self, **kwargs):
        super(PromoCreateView, self).__init__()
        context = super(PromoCreateView, self).get_context_data(**kwargs)
        context['current_page_title'] = "Health Data"
        return context

    def post(self, request, *args, **kwargs):
        response = request.POST.dict()
        response.pop('csrfmiddlewaretoken')
        Promo(promo_provider=request.user, **response).save()
        response_obj = HttpResponseRedirect(reverse('dashboard:promo_list'))
        response_obj.set_cookie('status', True)
        response_obj.set_cookie('message', "Promo successfully saved")
        return response_obj
