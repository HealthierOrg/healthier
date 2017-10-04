from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse
from django.views import View
from django.views.generic import DetailView, FormView, ListView, TemplateView
from django.template.loader import select_template
from healthier.consumers.models import Consumer
from healthier.dashboard.forms import AccountDetailForm, ServiceRequestConfigurationForm
from healthier.providers.models import Provider
from healthier.service.models import BaseHealthierService, ServiceRequests, OrderedService, SuggestService
from healthier.user.models import HealthierUser
from django_messages.views import compose


class BaseDashboardView(View):
    def __init__(self, **kwargs):
        super(BaseDashboardView, self).__init__(**kwargs)
        self.current_page_title = kwargs.get('current_page_title')

    def get(self, request, template_name, **context):
        template_name = select_template(
            [template_name, 'dashboard/provider_index.html' if request.user.account_type == "PRO" else \
                'dashboard/consumer_index.html'])
        return render(request, template_name, **context)

    def post(self, request):
        return request


class DashboardView(View):
    provider_dashboard = "dashboard/provider_index.html"
    consumer_dashboard = "dashboard/consumer_index.html"
    template_context = {}

    def get(self, request):
        self.template_context["current_page_title"] = "Dashboard"
        if request.user.account_type == "PRO":
            user_specific_template = self.provider_dashboard
            self.template_context["provider_customers"] = OrderedService.objects \
                .select_related('ordered_by__user_details_id__consumer_details') \
                .filter(provided_by__user_details_id_id=request.user.id)
            self.template_context["provider_services"] = ServiceRequests.objects.filter(requested_by__user_details_id=request.user
                                                                                        .id)
        else:
            user_specific_template = self.consumer_dashboard
        if not request.user.has_configured_account:
            return HttpResponseRedirect(reverse("dashboard:account_settings"))
        return render(request, user_specific_template, self.template_context)


class ProviderListView(ListView):
    template_name = 'pages/providers.html'
    context_object_name = 'providers'
    model = Provider

    def get_queryset(self):
        return Provider.objects.all()


class ProviderDetailView(DetailView):
    template_name = "pages/provider.html"
    model = Provider
    context_object_name = "provider"

    def get_object(self, queryset=None):
        return Provider.objects.get(id=self.kwargs["id"])


class FinancesView(View):
    template_name = "dashboard/index.html"

    def get(self, request):
        return render(request, self.template_name)


class CustomerListView(ListView):
    template_name = 'dashboard/customers.html'
    detail_template_name = 'dashboard/customer_detail.html'
    compose_message_template_name = 'dashboard/compose_message.html'
    context_data = {}
    context_object_name = 'consumers'
    model = Consumer

    def get(self, request, *args, **kwargs):
        self.context_data["consumers"] = OrderedService.objects \
                .select_related('ordered_by__user_details_id__consumer_details') \
                .filter(provided_by__user_details_id_id=self.request.user.id)
        self.context_data['has_tables'] = 'True'
        self.context_data['current_page_title'] = 'Customers'
        action = request.GET.get('action', None)
        customer_id = request.GET.get('id', None)
        if action == "info":
            self.context_data["current_page_title"] = "Customer Detail"
            self.context_data["base_consumer_info"] = HealthierUser.objects.get(id=customer_id)
            self.context_data["registered_services"] = OrderedService.objects.filter\
                (ordered_by__user_details_id=customer_id)
            return render(request, self.detail_template_name, self.context_data)
        elif action == 'sendMessage':
            return compose(request, recipient=customer_id, template_name=self.compose_message_template_name)
        elif action == "block":
            pass
        return render(request, self.template_name, self.context_data)


class CustomerDetailView(TemplateView):
    template_name = 'dashboard/customer_detail.html'
    model = BaseDashboardView
    context = {}

    def get(self, request, *args, **kwargs):
        customer_id = request.GET.get('id', None)
        print("I am here.")
        print(customer_id)
        self.context["current_page_title"] = "Customer Detail View"
        return render(request, self.template_name, self.context)


class UserServicesListView(ListView):
    template_name = "dashboard/my_services.html"
    model = Provider

    def get_context_data(self, **kwargs):
        super(UserServicesListView, self).__init__()
        context = super(UserServicesListView, self).get_context_data(**kwargs)
        user_details = Provider.objects.get(user_details_id_id=self.request.user.id)
        context["user_services"] = ServiceRequests.objects.filter(
            requested_by_id=user_details.id) if self.request.user.account_type == "PRO" \
            else OrderedService.objects.filter(ordered_by_id=self.request.user.id)
        context["all_services"] = BaseHealthierService.objects.all()
        return context


class ServiceDetailView(DetailView):
    template_name = "pages/service.html"
    model = BaseHealthierService
    context_object_name = "service"

    def get_object(self, queryset=None):
        return BaseHealthierService.objects.get(id=self.kwargs["id"])

    def get_context_data(self, **kwargs):
        context = super(ServiceDetailView, self).get_context_data(**kwargs)
        context["service"] = BaseHealthierService.objects.get(id=self.kwargs["id"])
        context["providers"] = ServiceRequests.objects.filter(service_id=self.kwargs["id"])
        return context


class AllServiceListView(ListView):
    template_name = "dashboard/all_services.html"
    context_object_name = "all_services"

    def get_queryset(self):
        not_rendered_services = BaseHealthierService.objects.exclude(servicerequests__requested_by__user_details_id=self.request.user.id)
        all_services = BaseHealthierService.objects.all()
        queryset = not_rendered_services if self.request.user.account_type == "PRO" else all_services
        return queryset

    def get_context_data(self, **kwargs):
        super(AllServiceListView, self).__init__()
        context = super(AllServiceListView, self).get_context_data(**kwargs)
        context["current_page_title"] = "All services"
        return context


class SuggestServiceView(TemplateView):
    template_name = "dashboard/suggest_new_service.html"
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
        healthier_user = self.form_class.objects.get(id=healthier_user_id)
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
        if attempt_update:
            response_obj = HttpResponseRedirect(reverse('dashboard:dashboard'))
            response_obj.set_cookie('status', True)
            response_obj.set_cookie('message', "Your account has been successfully updated")
            return response_obj
        return HttpResponse(request.POST)


class ServiceConfiguration(BaseDashboardView):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.template_name = 'dashboard/configure_service.html'

    def get(self, request, template_name='dashboard/configure_service.html', **kwargs):
        service_id = request.GET.get('service', None)
        service_details = BaseHealthierService.objects.get(id=service_id)
        provider_id = request.GET.get('providers', None)
        provider_details = Provider.objects.get(id=provider_id)
        return render(request, self.template_name,
                      {'service_details': service_details, 'provider_details': provider_details})

    def post(self, request, *args, **kwargs):
        pass


class ProfileView(TemplateView):
    def get(self, request, *args, **kwargs):
        return HttpResponse("I got here")


class ServiceRequestConfiguration(BaseDashboardView):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.template_name = 'dashboard/render_service.html'
        self.form_class = ServiceRequestConfigurationForm

    def get(self, request, template_name='dashboard/render_service.html', **context):
        service_id = self.request.GET.get('service', None)
        if not service_id:
            return HttpResponseRedirect(reverse('dashboard:services'))
        service_details = BaseHealthierService.objects.get(id=service_id)
        return render(request, self.template_name,
                      {'service_details': service_details, 'form': self.form_class,
                       'current_page_title': "Service Configuration"})

    def post(self, request):
        response = request.POST.dict()
        response.pop('csrfmiddlewaretoken')
        user_id = Provider.objects.get(user_details_id_id=request.user.id)
        service_id = self.request.GET.get('service', None)
        requested_service = ServiceRequests(is_ordered=True, requested_by=user_id, service_id=service_id, **response)
        requested_service.save()
        response_obj = HttpResponseRedirect(reverse('dashboard:dashboard_my_services'))
        response_obj.set_cookie('status', True)
        response_obj.set_cookie('message', "You have successfully added a new service.")
        return response_obj
