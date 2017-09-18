from django.conf.urls import url, include
from django.views.generic import TemplateView
from django.contrib.auth import views as auth_views
from healthier.auth.views import SignupView
from healthier.auth.views import LoginView


urlpatterns = [
    url(
        r'^login/$',
        LoginView.as_view(),
        {'template_name': 'account/login.html'},
        name='login'
    ),
    url(
        r'^logout/$',
        auth_views.logout,
        {'next_page': '/'},
        name='logout'
    ),
    url(
        regex=r'^register/$',
        view=SignupView.as_view(),
        name='register'
    ),
]
