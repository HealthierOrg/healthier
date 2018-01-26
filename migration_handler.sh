#!/usr/bin/env bash

echo "Starting ..."
echo ">> Running manage.py makemigrations"
python3.5 manage.py makemigrations

echo ">> Running manage.py migrate"
python3.5 manage.py migrate

echo ">> Done"

