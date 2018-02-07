from django.views.generic import DetailView
from django.views.generic import ListView
from healthier.service.models import HealthierService, ServiceGroup, ServiceGroupCategory

service_icons = ['deaf', 'ellipsis-h', 'eyedropper', 'bullseye', 'anchor', 'arrows-h', 'asterik',
                 'arrows-v', 'deaf', 'ellipsis-h', 'eyedropper', 'bullseye', 'anchor', 'arrows-h',
                 'asterik', 'arrows-v', 'deaf', 'ellipsis-h', 'eyedropper', 'bullseye', 'anchor',
                 'arrows-h', 'asterik', 'arrows-v']


class PaginatedCategoriesListView(ListView):
    template_name = 'pages/home.html'
    context_object_name = 'categories'
    paginate_by = 9
    model = ServiceGroupCategory


class AllCategoriesListView(ListView):
    template_name = 'pages/services.html'
    context_object_name = 'categories'
    paginate_by = 30
    model = ServiceGroupCategory

    def get_context_data(self, **kwargs):
        context = super(AllCategoriesListView, self).get_context_data(**kwargs)
        context['service_icon'] = service_icons
        return context


class GroupDetails(DetailView):
    template_name = "pages/service.html"
    model = HealthierService
    context_object_name = "groups"

    def get_object(self, queryset=None):
        return ServiceGroupCategory.objects.get(id=self.kwargs["group_id"])

    def get_context_data(self, **kwargs):
        context = super(GroupDetails, self).get_context_data(**kwargs)
        context["category_id"] = self.request.session['category_id']
        context["services"] = HealthierService.objects.filter(group__category_id=self.kwargs["group_id"], group_id=context["category_id"])
        return context


class GroupList(ListView):
    template_name = 'pages/group_lists.html'
    context_object_name = 'groupsie'
    paginate_by = 30
    model = ServiceGroup

    def get_context_data(self, **kwargs):
        context = super(GroupList, self).get_context_data(**kwargs)
        category_id = self.kwargs["id"]
        context["groups"] = ServiceGroup.objects.filter(category_id=category_id)
        self.request.session['category_id'] = category_id
        context['service_icon'] = service_icons
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
