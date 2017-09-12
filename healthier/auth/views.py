from django.shortcuts import render
from django.views.generic import TemplateView
from registration.views import RegistrationView


class SignupView(RegistrationView):
    template_name = "registration/registration_form.html"


class LoginView(TemplateView):
    pass
