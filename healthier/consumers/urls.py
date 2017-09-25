from django.conf.urls import url, include
from django.views.generic import TemplateView
from .views import DashboardView


consumer_dashboard_urls = [
    url(r'^/$', DashboardView.as_view(template_name='registration/registration_form.html'), name='dashboard'),
]


urlpatterns = [
    url(r'^$', TemplateView.as_view(template_name='pages/consumers.html'), name='consumers'),
    url(r'^dashboard/$', include(consumer_dashboard_urls)),
]


