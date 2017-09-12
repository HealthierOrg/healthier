from django.conf.urls import url, include
from django.views.generic import TemplateView
from .views import ConsumerCreate, ConsumerUpdate

urlpatterns = [
    url(r'^$', TemplateView.as_view(template_name='pages/providers.html'), name='consumers'),
    url(r'new/$', ConsumerCreate.as_view(template_name='pages/auth/consumer_signup.html'), name='consumer-add'),
]
