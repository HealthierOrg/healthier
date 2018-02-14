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
                _, edited = ServiceGroup.objects.get_or_create(
                    group_name=row[2],
                    category_id=row[0],
                    group_description="Description to be coming soon"
                )
                # creates a tuple of the new object or
                # current object and a boolean of if it was created



###2,13,TWINRIX (1 DOSE VIAL),6682.00,,,,,HEPATITIS A & B VACCINE
###2,11,INACTIVATED POLIO VACCINE (IPV),3770.00,,,,,INACTIVATED POLIO VACCINE (IPV)
###2,21, TETANUS TOXOID (1 DOSE SYRINGE),4810.00,,,,,TETANUS TOXOID
###2,25,Hepatitis B (1 DOSE VIAL),97500.00,,,,,HEPATITIS B IMMUNOGLOBULIN 200iu
##2,25,Hepatitis B (1 DOSE VIAL),253500.00,,,,,HEPATITIS B IMMUNOGLOBULIN 500iu
###2,27,IMMUNORHO,21677.50,,,,,Rho (D) IMMUNOGLOBULIN
###2,25,IMMUNOHBS (1 DOSE VIAL),76440.00,,,,,HEPATITIS B IMMUNOGLOBULIN 180iu
##2,26,ASNA-C,12707.50,,,,,POLYVALENT ANTI SNAKE VENOM
###2,26,VINS,12707.50,,,,,POLYVALENT ANTI SNAKE VENOM
