import threading

from django.utils.deprecation import MiddlewareMixin


class GlobalRequestMiddleware(MiddlewareMixin):
    _threadmap = {}

    @classmethod
    def get_current_request(cls):
        return cls._threadmap[threading.get_ident()]

    def process_request(self, request):
        self._threadmap[threading.get_ident()] = request

    def process_exception(self, request, exception):
        try:
            del self._threadmap[threading.get_ident()]
        except KeyError:
            pass

    def process_response(self, request, response):
        try:
            del self._threadmap[threading.get_ident()]
        except KeyError:
            pass
        return response
