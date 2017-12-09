from django.views.generic import DetailView
from django.views.generic import ListView
from healthier.service.models import HealthierService, ServiceRequests, ServiceGroupCategory


service_icons = ['deaf', 'ellipsis-h', 'eyedropper', 'bullseye', 'anchor', 'arrows-h', 'asterik',
                                   'arrows-v', 'deaf', 'ellipsis-h', 'eyedropper', 'bullseye', 'anchor', 'arrows-h',
                                   'asterik', 'arrows-v', 'deaf', 'ellipsis-h', 'eyedropper', 'bullseye', 'anchor',
                                   'arrows-h', 'asterik', 'arrows-v']


class PaginatedCategoriesListView(ListView):
    template_name = 'pages/services.html'
    context_object_name = 'categories'
    paginate_by = 9
    model = ServiceGroupCategory

    def get_context_data(self, **kwargs):
        context = super(PaginatedCategoriesListView, self).get_context_data(**kwargs)
        context['service_icon'] = service_icons
        return context


class AllCategoriesListView(ListView):
    template_name = 'pages/services.html'
    context_object_name = 'categories'
    paginate_by = 30
    model = ServiceGroupCategory

    def get_context_data(self, **kwargs):
        context = super(AllCategoriesListView, self).get_context_data(**kwargs)
        context['service_icon'] = service_icons
        return context


class CategoryDetails(DetailView):
    template_name = "pages/service.html"
    model = HealthierService
    context_object_name = "category"

    def get_object(self, queryset=None):
        return ServiceGroupCategory.objects.get(id=self.kwargs["id"])

    def get_context_data(self, **kwargs):
        context = super(CategoryDetails, self).get_context_data(**kwargs)
        context["services"] = HealthierService.objects.filter(group__category_id=self.kwargs["id"])
        return context


class AllServiceListView(ListView):
    template_name = 'pages/services.html'
    context_object_name = 'services'
    paginate_by = 100
    model = HealthierService

    def get_context_data(self, **kwargs):
        context = super(AllServiceListView, self).get_context_data(**kwargs)
        context['service_icon'] = service_icons
        return context

