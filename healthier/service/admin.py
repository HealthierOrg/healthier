from django.contrib import admin
from .models import BaseHealthierService, \
            MeasuredTest, ServiceRequests, \
            ServiceGroup, OrderedService, \
            ServiceReport, ServiceReportGroup,\
            ServiceGroupCategory, SuggestService

admin.site.register(BaseHealthierService)
admin.site.register(MeasuredTest)
admin.site.register(ServiceReport)
admin.site.register(ServiceReportGroup)
admin.site.register(OrderedService)
admin.site.register(ServiceGroup)
admin.site.register(ServiceRequests)
admin.site.register(ServiceGroupCategory)
admin.site.register(SuggestService)
