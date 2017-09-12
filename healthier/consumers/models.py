from django.contrib.auth.models import AbstractUser
from django.core.urlresolvers import reverse
from django.db import models
from django.utils.encoding import python_2_unicode_compatible
from django.utils.translation import ugettext_lazy as _



@python_2_unicode_compatible
class Consumer(AbstractUser):
    name = models.CharField(_('Name of User'), blank=True, max_length=255)  
    phone_number = models.CharField(max_length=200)
    date_of_birth = models.DateField(auto_now=False, auto_now_add=False)
    gender = models.CharField(max_length=5, choices=(('M',"Male"),("F","Female")))
    # picture = models.ImageField(upload_to="uploads/images/consumers/")
    # thumbnail = ImageSpecField(source='user_pix',
    #                                   processors=[ResizeToFill(100, 50)],
    #                                   format='JPEG',
    #                                   options={'quality': 60})
    
    def __str__(self):
        return self.username

    def get_absolute_url(self):
        return reverse('users:detail', kwargs={'username': self.username})
    # def get_absolute_url(self):
    #     return reverse('author-detail', kwargs={'pk': self.pk})
