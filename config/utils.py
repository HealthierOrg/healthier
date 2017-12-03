import random
import string

from django.conf import settings


def generate_id(account_type):
    chars = string.ascii_uppercase + string.digits
    account_map = "{0}_".format(account_type)
    rand = ''.join(random.choice(chars) for _ in range(settings.ACCOUNT_ID_LENGTH)).lower()
    return account_map + rand


def generate_order_id():
    return int(''.join([str(random.randint(0, 10)) for _ in range(7)]))


def generate_promo_id():
    chars = string.ascii_uppercase + string.digits
    return str(''.join([(random.choice(chars)) for _ in range(7)]))
