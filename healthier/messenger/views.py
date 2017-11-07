from django.contrib.auth.decorators import login_required
from django.http import Http404
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from django.urls import reverse
from django.utils import timezone
from django_messages.models import Message

from healthier.consumers.models import Consumer
from healthier.providers.models import Provider
from healthier.user.models import HealthierUser


@login_required
def compose(request, recipient=None):
    template_name = 'dashboard/messages/compose_message.html'
    context = {}
    if request.method == "POST":
        sender = request.user
        form_response = request.POST.dict()
        print(form_response['recipient'])
        form_response['recipient'] = HealthierUser.objects.get(request=form_response.get('recipient'))
        form_response.pop('csrfmiddlewaretoken')
        message_obj = Message(sender=sender, **form_response)
        message_obj.save()
        response_obj = HttpResponseRedirect(reverse('dashboard:message_inbox'))
        response_obj.set_cookie('status', True)
        response_obj.set_cookie('message', "Your message has been successfully sent.")
        return response_obj
    context['current_page_title'] = "Message Composer"
    print(request.user.account_type)
    context['recipient'] = Consumer.objects.all() if request.user.account_type == "PRO" else Provider.objects.all()
    print(context['recipient'])
    return render(request, template_name, context)


@login_required
def inbox(request, template_name='dashboard/messages/message_inbox.html'):
    message_list = Message.objects.inbox_for(request.user)
    print(message_list)
    return render(request, template_name, {
        'message_list': message_list,
        'current_page_title': 'Inbox'
    })


@login_required
def view(request, message_id, template_name='dashboard/messages/view_message.html'):
    user = request.user
    now = timezone.now()
    message = get_object_or_404(Message, id=message_id)
    subject = "Re: {0}".format(message.subject)
    inbox_list = Message.objects.inbox_for(request.user)
    if (message.sender != user) and (message.recipient != user):
        raise Http404
    if message.read_at is None and message.recipient == user:
        message.read_at = now
        message.save()
    context = {'message': message, 'current_page_title': 'View Message', 'inbox_list': inbox_list}
    if request.method == "POST":
        sender = request.user
        form_response = request.POST.dict()
        form_response.pop('csrfmiddlewaretoken')
        Message(sender=sender, parent_msg=message, subject=subject, replied_at=now, recipient_id=message.sender.id,
                **form_response).save()
        return HttpResponseRedirect(reverse('dashboard:message_inbox'))
    return render(request, template_name, context)


@login_required
def outbox(request, template_name='dashboard/messages/message_outbox.html'):
    message_list = Message.objects.outbox_for(request.user)
    return render(request, template_name, {
        'message_list': message_list,
        'current_page_title': 'Outbox'
    })
