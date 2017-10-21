from django.contrib import admin

from .models import HealthierUser, FAQ, Family

admin.site.register(HealthierUser)
admin.site.register(FAQ)
admin.site.register(Family)
