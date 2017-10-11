from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse
from django_messages.models import Message
from healthier.service.models import OrderedService
from healthier.user.models import HealthierUser


@login_required
def compose(request, template_name=None, recipient=None):
    template_name = template_name if template_name else 'dashboard/messages/compose_message.html'
    context = {}
    if request.method == "POST":
        sender = request.user
        form_response = request.POST.dict()
        form_response['recipient'] = HealthierUser.objects.get(id=form_response.get('recipient'))
        form_response.pop('csrfmiddlewaretoken')
        message_obj = Message(sender=sender, **form_response)
        message_obj.save()
        response_obj = HttpResponseRedirect(reverse('dashboard:message_inbox'))
        response_obj.set_cookie('status', True)
        response_obj.set_cookie('message', "Your message has been successfully sent.")
        return response_obj
    context['current_page_title'] = "Message Composer"
    context['recipient'] = OrderedService.objects \
                .select_related('ordered_by__user_details_id__consumer_details') \
                .filter(provided_by__user_details_id_id=request.user.id)
    return render(request, template_name, context)


@login_required
def inbox(request, template_name='dashboard/messages/message_inbox.html'):
    message_list = Message.objects.inbox_for(request.user)
    return render(request, template_name, {
        'message_list': message_list,'current_page_title': 'Inbox'
    })
