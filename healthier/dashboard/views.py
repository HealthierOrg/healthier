from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse
from django.views import View
from django.views.generic import CreateView
from django.views.generic import DetailView
from django.views.generic import FormView
from django.views.generic import ListView
from django.views.generic import TemplateView
from healthier.consumers.models import Consumer
from healthier.dashboard.forms import AccountDetailForm
from healthier.providers.models import Provider


class DashboardView(View):
    provider_dashboard = "dashboard/provider_index.html"
    consumer_dashboard = "dashboard/consumer_index.html"
    template_context = {}

    def get(self, request):
        user_specific_template = self.provider_dashboard if request.user.account_type == "PRO" else \
            self.consumer_dashboard
        self.template_context["current_page_title"] = "Dashboard"
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
    context_object_name = 'providers'
    model = Consumer

    def get_queryset(self):
        return Consumer.objects.all()

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name, {"has_tables": True, "current_page_title": "Customers"})


class ServicesListView(ListView):
    template_name = 'dashboard/services.html'
    context_object_name = 'providers'
    model = Consumer

    def get_queryset(self):
        return Consumer.objects.all()


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
        print("The form data is {}".format(form.data))
        return HttpResponse("What?")


class AccountSettingsView(BaseSettingsView):
    def __init__(self, **kwargs):
        super(AccountSettingsView, self).__init__(**kwargs)
        self.context_data = {"current_page_title": "Account Settings"}
        self.template_name = "dashboard/settings/account_settings.html"
        self.form_class = AccountDetailForm


class ServiceConfiguration(CreateView):
    template_name = "dashboard/customers.html"

    def form_invalid(self, form):
        pass

    def form_valid(self, form):
        pass

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)

    def post(self, request, *args, **kwargs):
        pass


class ProfileView(TemplateView):
    def get(self, request, *args, **kwargs):
        return HttpResponse("I got here")
