from django.shortcuts import render
from django.views.generic.edit import CreateView, UpdateView
from .models import Consumer

# Create your views here.
class ConsumerCreate(CreateView):
    model = Consumer
    fields =   [
            'phone_number', 
            'date_of_birth', 
            'gender', 
            'picture'
            ]


class ConsumerUpdate(UpdateView):
    model = Consumer
    fields =   [
            'phone_number', 
            'date_of_birth', 
            'gender', 
            'picture'
            ]
