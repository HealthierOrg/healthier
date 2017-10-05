from django.conf.urls import url

from .views import ServiceDetailView

urlpatterns = [
    url(r'^(?P<id>\d+)$', ServiceDetailView.as_view(template_name='pages/service.html'), name='service'),
]
