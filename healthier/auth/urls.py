from django.conf.urls import url, include
from django.views.generic import TemplateView

urlpatterns = [
    url(
        regex=r'^login$',
        view=TemplateView.as_view(),
        name='login'
    ),
    url(
        regex=r'^demo/$',
        view=TemplateView.as_view(),
        name='demo'
    ),
    url(
        regex=r'^register/$',
        view=TemplateView.as_view(),
        name='register'
    ),
]
