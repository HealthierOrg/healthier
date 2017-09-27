from django.conf.urls import url, include
from django.contrib.auth.decorators import login_required
from django.views.generic import TemplateView

from healthier.service.views import ServiceConfiguration
from .views import DashboardView


consumer_dashboard_service_urls = [
    url(r'^/$', DashboardView.as_view(template_name='registration/registration_form.html'), name='service'),
    url(r'^configure/$', DashboardView.as_view(template_name='registration'
                                                             '/registration_form.html'),
        name='configure'),
]

consumer_dashboard_urls = [
    url(r'^/$', DashboardView.as_view(template_name='registration/registration_form.html'), name='dashboard'),
    url(r'^service/$', include(consumer_dashboard_service_urls)),
]

urlpatterns = [
    url(r'^$', TemplateView.as_view(template_name='pages/consumers.html'), name='consumers'),
    url(r'^dashboard/$', TemplateView.as_view(template_name='pages/consumers.html'), name='dashboard'),
    url(r'^dashboard/service/$', TemplateView.as_view(template_name='pages/consumers.html'), name='dashboard_service'),
    url(r'^dashboard/service/configure/$', login_required(ServiceConfiguration.as_view()), name='dashboard_service_configuration'),
]
