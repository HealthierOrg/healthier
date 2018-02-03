from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^subscribe/$', views.add_to_mailing_list, name='subscribe'),
]

