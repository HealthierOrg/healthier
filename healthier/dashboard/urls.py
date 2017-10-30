from django.conf.urls import url, include
from django.contrib.auth.decorators import login_required
from .views import *
from healthier.messenger.views import compose, inbox, view, outbox

urlpatterns = [
    url(r'^$', DashboardView.as_view(), name='dashboard'),
    url(r'profile^$', login_required(ProfileView.as_view()), name='profile'),
    url(r'^finances$', login_required(FinancesView.as_view()), name='finance'),
    url(r'^customers$', login_required(CustomerListView.as_view()), name='consumer'),
    url(r'^providers$', login_required(AllProviderListView.as_view()), name='provider'),
    url(r'^providers/(?P<pk>\d+)/$', login_required(ProviderDetailView.as_view()), name='provider_details'),

    ### Service URLs
    url(r'^services/(?P<service_id>\d+)$', ServiceDetailView.as_view(), name='service_details'),
    url(r'^services/me$', login_required(UserServicesListView.as_view()),
        name='dashboard_my_services'),
    url(r'^services/all$', login_required(AllServiceListView.as_view()),
        name='dashboard_all_services'),
    url(r'^service/report/all$', login_required(AllServiceReportView.as_view()), name='service_report'),
    url(r'^service/report/$', login_required(AllServiceReportView.as_view()), name='service_report'),
    url(r'^service/render/(?P<service_id>\d+)$', login_required(OrderServiceConfigurationView.as_view()),
        name='render_service'),
    url(r'^service/render/alt/$', login_required(OrderServiceConfigurationView.as_view()),
        name='render_service_alt'),
    url(r'^service/order_service/checkout/$', login_required(ServiceConfiguration.as_view()),
        name='order_service'),
    url(r'^service/order_service/checkout/failure/$', login_required(FailedPaymentView.as_view()),
        name='order_service_checkout_failed'),
    url(r'^service/order_service/(?P<action>[\w\-]+)/$', login_required(OrderServiceStepView.as_view()),
        name='order_service_step'),
    url(r'^services/suggest_new$', login_required(SuggestServiceView.as_view()),
        name='dashboard_suggest_new_service'),

    # Settings URLs
    url(r'^settings/account$', login_required(AccountSettingsView.as_view()),
        name='account_settings'),
    url(r'^settings/finance$', login_required(AccountSettingsView.as_view()), name='finance_settings'),
    url(r'^settings/consumer$', login_required(AccountSettingsView.as_view()), name='consumer_settings'),
    url(r'^settings/service$', login_required(AccountSettingsView.as_view()), name='service_settings'),

    # Message URLs
    url(r'^messages/view/(?P<message_id>\d+)$', view, name='view_message'),
    url(r'^messages/compose_message/$', compose, name='compose_message'),
    url(r'^messages/outbox/$', outbox, name='message_outbox'),
    url(r'^messages/inbox/$', inbox, name='message_inbox'),

    # Family URLs

    url(r'^family/$', login_required(UserFamilyListView.as_view()),
        name='family'),
    url(r'^family/add/$', login_required(AddFamilyView.as_view()),
        name='add_family'),
    url(r'^family/remove/(?P<member_id>\d+)$', login_required(remove_family),
        name='remove_family'),

    url(r'^health_info/view/$', login_required(HealthDataView.as_view()), name='view_health_info'),
    url(r'^health_info/set/$', login_required(HealthDataUpload.as_view()), name='set_health_info')
]
