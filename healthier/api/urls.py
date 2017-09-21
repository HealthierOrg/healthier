from django.conf.urls import url
from healthier.api import views

urlpatterns = [
    url(r'^consumer/get/$', views.consumer_detail),
    url(r'^provider/get/$', views.provider_detail),
    url(r'^service/get/$', views.service_detail),
]