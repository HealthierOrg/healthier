from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404
from django.views import View
from django.views.generic import DetailView
from django.views.generic import ListView
from healthier.consumers.models import Consumer
from healthier.providers.models import Provider
from healthier.service.models import ServiceRequests


class DashboardView(View):
    template_name = "dashboard/index.html"

    def get(self, request):
        return render(request, self.template_name)


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

    def get_context_data(self, **kwargs):
        super(ProviderDetailView, self).__init__()
        context = super(ProviderDetailView, self).get_context_data(**kwargs)
        print(self.kwargs["id"])
        print(ServiceRequests.objects.filter(requested_by_id=self.kwargs["id"]))
        context['services'] = ServiceRequests.objects.filter(requested_by_id=self.kwargs["id"])
        return context


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


class SettingsView(View):
    template_name = "dashboard/index.html"

    def get(self, request):
        return render(request, self.template_name)

