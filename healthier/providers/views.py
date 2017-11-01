from django.views.generic import DetailView
from django.views.generic import ListView
from healthier.providers.models import Provider
from healthier.service.models import ServiceRequests
from healthier.user.models import FAQ, TermsAndCondition


class ProviderListView(ListView):
    template_name = 'pages/providers.html'
    context_object_name = 'providers'
    model = Provider

    def get_queryset(self):
        return Provider.objects.all()

    def get_context_data(self, **kwargs):
        super(ProviderListView, self).__init__()
        context = super(ProviderListView, self).get_context_data(**kwargs)
        context['faqs'] = FAQ.objects.all()
        context['icons'] = ['deaf', 'ellipsis-h', 'eyedropper', 'bullseye', 'anchor',
                                   'arrows-h', 'asterik', 'arrows-v', 'deaf', 'ellipsis-h', 'eyedropper', 'bullseye',
                                   'anchor',
                                   'arrows-h', 'asterik', 'arrows-v',
                                   'deaf', 'ellipsis-h', 'eyedropper', 'bullseye', 'anchor',
                                   'arrows-h', 'asterik', 'arrows-v']
        return context


class ProviderDetailView(DetailView):
    template_name = "pages/provider.html"
    model = Provider
    context_object_name = "provider"

    def get_object(self, queryset=None):
        return Provider.objects.get(id=self.kwargs["id"])

    def get_context_data(self, **kwargs):
        super(ProviderDetailView, self).__init__()
        context = super(ProviderDetailView, self).get_context_data(**kwargs)
        context['services'] = ServiceRequests.objects.filter(requested_by_id=self.kwargs["id"])
        return context


class FAQView(ListView):
    context_object_name = 'faqs'
    model = FAQ

    def get_queryset(self):
        return FAQ.objects.all()


class TsAndCs(ListView):
    context_object_name = "tandcs"
    model = TermsAndCondition
