from django.core import mail
from django.core.mail import EmailMessage
from django.template.loader import get_template
from django.urls import reverse
from django.contrib.sites.models import Site
from healthier.user.middleware.globalrequestmiddleware import GlobalRequestMiddleware


"""


>>> from django.contrib.sites.models import Site
>>> domain = Site.objects.get_current().domain
>>> obj = MyModel.objects.get(id=3)
>>> path = obj.get_absolute_url()

>>> url = 'http://{domain}{path}'.format(domain=domain, path=path)
>>> print(url)


"""


class Mailer:
    """
    Send email messages helper class
    """

    def __init__(self, from_email=None):
        # TODO setup the default from email
        self.connection = mail.get_connection()
        self.from_email = from_email

    def send_messages(self, subject, template, context, to_emails):
        request = GlobalRequestMiddleware.get_current_request()
        domain = Site.objects.get_current()
        context['user'] = request.user
        context['current_site'] = domain
        context['site_name'] = "Healthier"
        context['site_domain'] = "healthier.download"
        activate_url = reverse('account_confirm_email', kwargs={'key': 4})
        context['activate_url'] = 'http://{domain}{path}'.format(domain=domain, path=activate_url)
        messages = self.__generate_messages(subject, template, context, to_emails)
        self.__send_mail(messages)

    def __send_mail(self, mail_messages):
        """
        Send email messages
        :param mail_messages:
        :return:
        """
        self.connection.open()
        self.connection.send_messages(mail_messages)
        self.connection.close()

    def __generate_messages(self, subject, template, context, to_emails):
        """
        Generate email message from Django template
        :param subject: Email message subject
        :param template: Email template
        :param to_emails: to email address[es]
        :return:
        """
        messages = []
        message_template = get_template(template)
        for recipient in to_emails:
            message_content = message_template.render(context)
            print(message_content)
            message = EmailMessage(subject, message_content, to=[recipient], from_email=self.from_email)
            message.content_subtype = 'html'
            messages.append(message)

        return messages
