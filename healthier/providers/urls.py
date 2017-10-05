from django.conf.urls import url
from .views import DashboardView, ProviderDetailView, ProviderListView, FinancesView, CustomerListView, SettingsView, ServicesListView

urlpatterns = [
    url(r'^$', ProviderListView.as_view(template_name='pages/providers.html'), name='providers'),
    url(r'^(?P<id>\d+)$', ProviderDetailView.as_view(template_name='pages/provider.html'), name="provider"),
    url(r'^dashboard/$', DashboardView.as_view(), name='dashboard'),
    url(r'^dashboard/request$', DashboardView.as_view(), name='dashboard'),
    url(r'^dashboard/finances$', FinancesView.as_view(), name='provider_dashboard_finances'),
    url(r'^dashboard/customers', CustomerListView.as_view(), name='provider_dashboard_customers'),
    url(r'^dashboard/services/my', ServicesListView.as_view(), name='provider_dashboard_services'),
    url(r'^dashboard/services/all', ServicesListView.as_view(), name='provider_dashboard_services'),
    url(r'^dashboard/services/request_new', ServicesListView.as_view(), name='provider_dashboard_services'),
    url(r'^dashboard/settings', SettingsView.as_view(), name='provider_dashboard_settings'),

]
