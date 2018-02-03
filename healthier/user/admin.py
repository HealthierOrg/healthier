from django.contrib import admin

from .models import HealthierUser, FAQ, Family, TermsAndCondition, EmailList, Testimonials

admin.site.register(HealthierUser)
admin.site.register(FAQ)
admin.site.register(Family)
admin.site.register(EmailList)
admin.site.register(TermsAndCondition)
admin.site.register(Testimonials)
