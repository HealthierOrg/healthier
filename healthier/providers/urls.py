from django.conf.urls import url
from django.views.generic import TemplateView
from .views import DashboardView


urlpatterns = [
    url(r'^$', TemplateView.as_view(template_name='pages/providers.html'), name='providers'),
    url(r'^dashboard/$', DashboardView.as_view(template_name='registration/registration_form.html'), name='dashboard'),
]
