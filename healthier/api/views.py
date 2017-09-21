from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from healthier.consumers.models import Consumer
from healthier.providers.models import Provider
from healthier.service.models import HealthService
from healthier.api.serializers import ConsumerSerializer, ProviderSerializer


@api_view(['GET', 'PUT', 'DELETE'])
def consumer_detail(request):
    """
    Retrieve, update or delete a consumer instance.
    """

    id = request.query_params.get('id', None)
    if not id:
        consumers = Consumer.objects.all()
        serializer = ConsumerSerializer(consumers, many=True)
        return Response(serializer.data)
    else:
        try:
            consumer = Consumer.objects.get(healthier_ID=id)
        except Consumer.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)

        if request.method == 'GET':
            serializer = ConsumerSerializer(consumer)
            return Response(serializer.data)

        elif request.method == 'PUT':
            serializer = ConsumerSerializer(consumer, data=request.query_params, partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        elif request.method == 'DELETE':
            consumer.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)


@api_view(['GET', 'PUT', 'DELETE'])
def provider_detail(request):
    """
    Retrieve, update or delete a provider instance.
    """

    id = request.query_params.get('id', None)
    if not id:
        providers = Provider.objects.all()
        serializer = ProviderSerializer(providers, many=True)
        return Response(serializer.data)
    else:
        try:
            provider = Provider.objects.get(healthier_ID=id)
        except Provider.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)

        if request.method == 'GET':
            serializer = ProviderSerializer(provider)
            return Response(serializer.data)

        elif request.method == 'PUT':
            serializer = ProviderSerializer(provider, data=request.query_params, partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        elif request.method == 'DELETE':
            provider.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['GET', 'PUT', 'DELETE'])
def service_detail(request):
    """
    Retrieve, update or delete a healthservice instance.
    """

    id = request.query_params.get('id', None)
    if not id:
        services = HealthService.objects.all()
        serializer = HealthServiceSerializer(services, many=True)
        return Response(serializer.data)
    else:
        try:
            service = HealthServiceSerializer.objects.get(service_ID=id)
        except HealthService.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)

        if request.method == 'GET':
            serializer = HealthServiceSerializer(service)
            return Response(serializer.data)

        elif request.method == 'PUT':
            serializer = HealthServiceSerializer(service, data=request.query_params, partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        elif request.method == 'DELETE':
            service.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)