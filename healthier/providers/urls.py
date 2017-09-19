from django.conf.urls import url
from .views import DashboardView, ProviderDetailView, ProviderListView


urlpatterns = [
    url(r'^$', ProviderListView.as_view(template_name='pages/providers.html'), name='providers'),
    url(r'^(?P<id>\d+)$', ProviderDetailView.as_view(template_name='pages/provider.html'), name="provider"),
    url(r'^dashboard/$', DashboardView.as_view(template_name='registration/registration_form.html'), name='dashboard'),
]
