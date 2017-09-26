from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from django.urls import reverse
from django.views import View
from django.views.generic import CreateView
from django.views.generic import DetailView
from django.views.generic import FormView
from django.views.generic import ListView
from django.views.generic import UpdateView

from healthier.consumers.models import Consumer
from healthier.dashboard.forms import AccountDetailForm
from healthier.providers.models import Provider
from healthier.user.models import HealthierUser


class DashboardView(View):
    provider_dashboard = "dashboard/provider_index.html"
    consumer_dashboard = "dashboard/consumer_index.html"
    view_context = {}

    def get(self, request):
        user_specific_template = self.provider_dashboard if request.user.account_type == "PRO" else \
            self.consumer_dashboard
        self.view_context["current_page_title"] = "Dashboard"
        if not request.user.has_configured_account:
            return HttpResponseRedirect(reverse("dashboard:account_settings"))
        return render(request, user_specific_template, self.view_context)


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


class SettingsView(FormView):
    settings_type = "account"
    template_name_map = {"account": "account_settings.html", "finance": "finance_settings.html",
                         "consumer": "consumer_settings.html", "service": ""}
    form_class_map = {"account": AccountDetailForm, "finance": "", "consumer": "", "service": ""}
    form_class = form_class_map[settings_type]
    template_name = "dashboard/settings/{0}".format(template_name_map[settings_type])
    success_url = reverse("dashboard:profile")

    def form_invalid(self, form):
        return HttpResponse("Hello")

    def form_valid(self, form):
        pass

    def get_context_data(self, **kwargs):
        context = super(SettingsView, self).get_context_data(**kwargs)
        context["current_page_title"] = "Account Setting"
        return context

    def get_object(self, queryset=None):
        obj = HealthierUser.objects.get(id=self.kwargs['id'])
        return obj


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


