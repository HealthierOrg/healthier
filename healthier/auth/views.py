from django.contrib.auth import authenticate, login
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.views import View
from healthier.providers.forms import ProviderRegistrationForm
from healthier.consumers.forms import ConsumerRegistrationForm
from healthier.providers.models import Provider
from healthier.consumers.models import Consumer


class RegistrationView(View):
    template_name = 'registration/registration_form.html'
    provider_form = ProviderRegistrationForm
    consumer_form = ConsumerRegistrationForm

    def get(self, request):
        return render(request, self.template_name)

    def post(self, request):
        account_type = request.POST['account_type']
        form = ProviderRegistrationForm(request.POST) if account_type == "Provider" \
            else ConsumerRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data.get('password'))
            user.save()
            return redirect("{0}:dashboard".format(account_type.lower()))
        return HttpResponse(form.errors)


class LoginView(View):
    template_name = 'registration/login.html'
    provider_form = ProviderRegistrationForm
    consumer_form = ConsumerRegistrationForm

    def get(self, request):
        return render(request, self.template_name)

    def post(self, request):
        account_type = request.POST['account_type']
        email = request.POST['email']
        password = request.POST['password']
        account = Provider if account_type == "Provider" else Consumer
        try:
            user = account.objects.get(email=email)
            if user.check_password(password):
                username = user.email
                user = authenticate(username=username, password=password)
                login(request, user)
                print(request.session)
                request.session["current_user"] = user
                return redirect("{0}:dashboard".format(account_type.lower()))
            return render(request, self.template_name, context={"error": "Invalid Password. Please, try again."})
        except account.DoesNotExist:
            return render(request, self.template_name, context={"error": "No account is associated with this email"})


class LogoutView(View):

    def get(self, request):
        del request.session
        return redirect("/")
