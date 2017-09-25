from django.views.generic import DetailView
from django.views.generic import ListView

from healthier.providers.models import Provider
from healthier.service.models import BaseHealthierService, OrderedService


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
        context["providers"] = OrderedService.objects.get(service_id=self.kwargs["id"])
        return context

