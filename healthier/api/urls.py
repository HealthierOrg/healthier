from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^user/$', views.UserDetail.as_view()),
    url(r'^consumer/get/$', views.ConsumerDetail.as_view()),
    url(r'^provider/get/$', views.ProviderDetail.as_view()),
    url(r'^docs/$', views.SwaggerSchemaView.as_view()),
]

