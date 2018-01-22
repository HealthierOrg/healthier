##!/usr/bin/env bash
#
#echo "Starting ..."
#
#echo ">> Deleting old migrations"
#find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
#find . -path "*/migrations/*.pyc"  -delete
#
#
## Optional
#echo ">> Deleting database"
#find . -name "db.sqlite3" -delete
#
#echo ">> Running manage.py makemigrations"
#python manage.py makemigrations
#
#echo ">> Running manage.py migrate"
#python manage.py migrate
#
#echo ">> Done"


#!/usr/bin/env bash

set -e

sourceApp="$1"
targetApp="$2"

while read key value; do
  key=${key%%:}
  echo "Setting $key=$value"
  heroku config:set "$key=$value" --app "$targetApp"
done  < <(heroku config --app "$sourceApp" | sed -e '1d')
