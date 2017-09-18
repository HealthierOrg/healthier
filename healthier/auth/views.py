from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.views import View
from healthier.providers.forms import ProviderRegistrationForm
from healthier.consumers.forms import ConsumerRegistrationForm


class RegistrationView(View):
    template_name = 'registration/registration_form.html'
    provider_form = ProviderRegistrationForm
    consumer_form = ConsumerRegistrationForm

    def get(self, request):
        return render(request, self.template_name)

    def post(self, request, *args, **kwargs):
        account_type = request.POST['account_type']
        form = ProviderRegistrationForm(request.POST) if account_type == "Provider" \
            else ConsumerRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data.get('password'))
            user.save()
            return redirect("providers:dashboard")
        return HttpResponse(form.errors)

