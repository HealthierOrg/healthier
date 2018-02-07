from django.core.management.base import BaseCommand
from healthier.service.models import ServiceGroupCategory, ServiceGroup
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
                _, created = ServiceGroupCategory.objects.get_or_create(
                    category_name=row[1],
                    category_description=row[2]
                )
                # creates a tuple of the new object or
                # current object and a boolean of if it was created

