from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from .views import DashboardView, FinancesView, CustomerListView, AccountSettingsView, ServicesListView,\
    ServiceConfiguration, ProfileView


urlpatterns = [
    url(r'^$', DashboardView.as_view(), name='dashboard'),
    url(r'profile^$', ProfileView.as_view(), name='profile'),
    url(r'^finances$', FinancesView.as_view(), name='finance'),
    url(r'^customers$', CustomerListView.as_view(), name='customers'),
    url(r'^services$', ServicesListView.as_view(), name='services'),
    url(r'^settings/account$', AccountSettingsView.as_view(), name='account_settings'),
    url(r'^settings/finance', AccountSettingsView.as_view(), name='finance_settings'),
    url(r'^settings/consumer', AccountSettingsView.as_view(), name='consumer_settings'),
    url(r'^settings/service', AccountSettingsView.as_view(), name='service_settings'),
    url(r'^service/configure$', login_required(ServiceConfiguration.as_view()),
        name='service_configuration'),

]
