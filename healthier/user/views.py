from django.http import HttpResponseRedirect
from .forms import EmailListForm
from django.contrib import messages


def add_to_mailing_list(request):
    if request.method == 'POST':
        form = EmailListForm(request.POST)
        if form.is_valid():
            form.is_user = True if request.user else False
            messages.info(request, 'You have succesfully signed up for email updates!')
            form.save()
            return HttpResponseRedirect('/')
        print(form.errors)
        messages.error(request, 'Unable to setup your email for news alert')
        return HttpResponseRedirect('/')
    else:
        form = EmailListForm()

    return HttpResponseRedirect('/', {'form':form})
