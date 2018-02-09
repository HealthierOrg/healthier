from django.core.management.base import BaseCommand
from healthier.service.models import HealthierService
import csv


class Command(BaseCommand):
    help = 'A description of your command'

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
                _, created = HealthierService.objects.get_or_create(
                    group_id=row[1],
                    service_name=row[2],
                    details=row[3],
                    orders=row[4],
                    views=row[5]
                )
                # creates a tuple of the new object or
                # current object and a boolean of if it was created
