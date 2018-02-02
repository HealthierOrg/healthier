#!/usr/bin/env python
import os
import sys

if __name__ == '__main__':
    print(__import__('django'))  # Should print the module information
    print(__import__('django').__file__)  # Should print the location of __init__.py file
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')

    try:
        from django.core.management import execute_from_command_line
    except ImportError:
        # The above import may fail for some other reason. Ensure that the
        # issue is really that Django is missing to avoid masking other
        # exceptions on Python 2.
        try:
            import django  # noqa
        except ImportError:
            raise ImportError(
                "Couldn't import Django. Are you sure it's installed and "
                "available on your PYTHONPATH environment variable? Did you "
                "forget to activate a virtual environment?"
            )
        raise

    # This allows easy placement of apps within the interior
    # healthier directory.
    current_path = os.path.dirname(os.path.abspath(__file__))
    sys.path.append(os.path.join(current_path, 'healthier'))

    execute_from_command_line(sys.argv)
