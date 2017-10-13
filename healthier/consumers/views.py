from django.http import HttpResponse
from django.views import View


class DashboardView(View):
    template_name = ""

    def get(self, request):
        return HttpResponse("Welcome To Consumer")
