from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404
from django.views import View
from django.views.generic import DetailView
from django.views.generic import ListView

from healthier.providers.models import Provider


class DashboardView(View):
    template_name = ""

    def get(self, request):
        return HttpResponse("Welcome Here")


class ProviderListView(ListView):
    template_name = 'pages/providers.html'
    context_object_name = 'providers'
    model = Provider

    def get_queryset(self):
        return Provider.objects.all()


class ProviderDetailView(DetailView):
    template_name = "pages/provider.html"
    model = Provider
    context_object_name = "provider"

    def get_object(self, queryset=None):
        return Provider.objects.get(id=self.kwargs["id"])
