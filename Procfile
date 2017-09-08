web: gunicorn config.wsgi:application
worker: celery worker --app=healthier.taskapp --loglevel=info
