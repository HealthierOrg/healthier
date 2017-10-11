from django.conf.urls import url
from django.contrib.auth.decorators import login_required

from .views import DashboardView, FinancesView, CustomerListView, AccountSettingsView,\
    ServiceConfiguration, ProfileView, ServiceRequestConfiguration, UserServicesListView, AllServiceListView, \
    ServiceDetailView, SuggestServiceView, AllProviderListView, ProviderDetailView, OrderServiceStepView
from healthier.messenger.views import compose, inbox


urlpatterns = [
    url(r'^$', DashboardView.as_view(), name='dashboard'),
    url(r'profile^$', login_required(ProfileView.as_view()), name='profile'),
    url(r'^finances$', login_required(FinancesView.as_view()), name='finance'),
    url(r'^customers$', login_required(CustomerListView.as_view()), name='consumer'),
    url(r'^providers$', login_required(AllProviderListView.as_view()), name='provider'),
    url(r'^providers/(?P<pk>\d+)/$', login_required(ProviderDetailView.as_view()), name='provider_details'),
    url(r'^services/(?P<service_id>\d+)$', ServiceDetailView.as_view(), name='service_details'),
    url(r'^services/me$', login_required(UserServicesListView.as_view()),
        name='dashboard_my_services'),
    url(r'^services/all$', login_required(AllServiceListView.as_view()),
        name='dashboard_all_services'),
    url(r'^service/report$', login_required(AccountSettingsView.as_view()), name='service_report'),
    url(r'^service/render$', login_required(ServiceRequestConfiguration.as_view()),
        name='render_service'),
    url(r'^service/order_service/checkout$', login_required(ServiceConfiguration.as_view()),
        name='order_service'),
    url(r'^service/order_service/step/(?P<action>\w+)/(?P<service_id>\w+)$', login_required(OrderServiceStepView.as_view()),
        name='order_service_step'),
    url(r'^services/suggest_new$', login_required(SuggestServiceView.as_view()),
        name='dashboard_suggest_new_service'),
    url(r'^settings/account$', login_required(AccountSettingsView.as_view()),
        name='account_settings'),
    url(r'^settings/finance$', login_required(AccountSettingsView.as_view()), name='finance_settings'),
    url(r'^settings/consumer$', login_required(AccountSettingsView.as_view()), name='consumer_settings'),
    url(r'^settings/service$', login_required(AccountSettingsView.as_view()), name='service_settings'),
    # url(r'^messages/$', include('django_messages.urls')),
    url(r'^messages/compose_message/$', compose, name='compose_message'),
    url(r'^messages/outbox/$', compose, name='message_outbox'),
    url(r'^messages/inbox/$', inbox, name='message_inbox'),
]
