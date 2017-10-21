from django.conf.urls import url

from .views import ServiceDetailView, AllServiceListView

urlpatterns = [
    url(r'^(?P<id>\d+)$', ServiceDetailView.as_view(), name='service'),
    url(r'^$', AllServiceListView.as_view(), name='all'),
]
