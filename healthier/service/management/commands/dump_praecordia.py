from django.core.management.base import BaseCommand
from healthier.service.models import ServiceGroupCategory, ServiceGroup, ServiceRequests,HealthierService
from healthier.user.models import HealthierUser

import csv


class Command(BaseCommand):
    help = 'Dump Group'

    def add_arguments(self, parser):
        parser.add_argument(
            '--file', dest='path', required=True,
            help='the file to process',
        )

    def handle(self, *args, **options):
        url = options['path']
        with open(url) as f:
            reader = csv.reader(f)
            for row in reader:
                print((row[0]), (row[1]), (row[2]))
                # _, edited = HealthierService.objects.get(service_name=row[2])
                _, insert = ServiceRequests.objects.get_or_create(
                    service_id=HealthierService.objects.get(service_name=row[2]).id, requested_by_id=2, price=float(row[3]), provision_description="We provide this service"
                )


