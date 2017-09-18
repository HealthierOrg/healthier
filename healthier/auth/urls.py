from django.conf.urls import url, include
from django.views.generic import TemplateView
from . import views

urlpatterns = [
    url(r'^login/$', TemplateView.as_view(template_name='pages/providers.html'), name='login'),
    url(r'^register/$', views.RegistrationView.as_view(template_name='registration/registration_form.html'), name='register'),
]
