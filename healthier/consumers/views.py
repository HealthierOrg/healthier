from django.http import HttpResponse
from django.shortcuts import render
from django.views import View


class DashboardView(View):
    template_name = ""

    def get(self, request):
        return HttpResponse("Welcome To Consumer")
