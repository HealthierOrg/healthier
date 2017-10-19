from django.views.generic import DetailView
from django.views.generic import ListView
from healthier.service.models import HealthierService, ServiceRequests


class AllServiceListView(ListView):
    template_name = 'pages/services.html'
    context_object_name = 'services'
    model = HealthierService

    def get_context_data(self, **kwargs):
        context = super(AllServiceListView, self).get_context_data(**kwargs)
        context['service_icon'] = ['deaf', 'ellipsis-h', 'eyedropper', 'bullseye', 'anchor',
                                   'arrows-h', 'asterik', 'arrows-v','deaf', 'ellipsis-h', 'eyedropper', 'bullseye', 'anchor',
                                   'arrows-h', 'asterik', 'arrows-v',
                                   'deaf', 'ellipsis-h', 'eyedropper', 'bullseye', 'anchor',
                                   'arrows-h', 'asterik', 'arrows-v']
        return context

    def get_queryset(self):
        return HealthierService.objects.all()


class ServiceDetailView(DetailView):
    template_name = "pages/service.html"
    model = HealthierService
    context_object_name = "service"

    def get_object(self, queryset=None):
        return HealthierService.objects.get(id=self.kwargs["id"])

    def get_context_data(self, **kwargs):
        context = super(ServiceDetailView, self).get_context_data(**kwargs)
        context["service"] = HealthierService.objects.get(id=self.kwargs["id"])
        context["providers"] = ServiceRequests.objects.get(service_id=self.kwargs["id"])
        return context
