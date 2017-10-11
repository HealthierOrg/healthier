from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.views.generic import DetailView, CreateView
from django.views.generic import ListView
from healthier.service.models import BaseHealthierService, ServiceRequests


class ServicesListView(ListView):
    template_name = 'pages/home.html'
    context_object_name = 'services'
    model = BaseHealthierService

    def get_queryset(self):
        return BaseHealthierService.objects.all()


class ServiceDetailView(DetailView):
    template_name = "pages/service.html"
    model = BaseHealthierService
    context_object_name = "service"

    def get_object(self, queryset=None):
        return BaseHealthierService.objects.get(id=self.kwargs["id"])

    def get_context_data(self, **kwargs):
        context = super(ServiceDetailView, self).get_context_data(**kwargs)
        context["service"] = BaseHealthierService.objects.get(id=self.kwargs["id"])
        context["providers"] = ServiceRequests.objects.get(service_id=self.kwargs["id"])
        return context


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

