from django.contrib.auth import authenticate, login
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.views import View
from healthier.providers.models import Provider
from healthier.consumers.models import Consumer
from healthier.user.forms import SignupForm


class RegistrationView(View):
    template_name = 'registration/registration_form.html'

    def get(self, request):
        return render(request, self.template_name)

    def post(self, request):
        account_type = request.POST['account_type']
        form = SignupForm(request.POST)
        print(form)
        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data.get('password'))
            user.save()
            return redirect("{0}:dashboard".format(account_type.lower()))
        return HttpResponse(form.errors)


class LoginView(View):
    template_name = 'registration/login.html'

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
                request.session["current_user"] = user
                return redirect("{0}:dashboard".format(account_type.lower()))
            return render(request, self.template_name, context={"error": "Invalid Password. Please, try again."})
        except account.DoesNotExist:
            return render(request, self.template_name, context={"error": "No account is associated with this email"})


class LogoutView(View):

    def get(self, request):
        del request.session
        return redirect("/")
