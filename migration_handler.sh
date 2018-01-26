#!/usr/bin/env bash

echo "Starting ..."

echo ">> Deleting old migrations"
find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
find . -path "*/migrations/*.pyc"  -delete

echo ">> Running manage.py makemigrations"
python manage.py makemigrations

echo ">> Running manage.py migrate"
python manage.py migrate

echo ">> Done"

