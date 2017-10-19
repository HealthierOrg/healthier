from django.contrib import admin

from .models import HealthierUser, FAQ

admin.site.register(HealthierUser)
admin.site.register(FAQ)
