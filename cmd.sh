#!/bin/bash
set -e

if [ "$ENV" = 'DEV' ]; then
    echo "Running Development Server" # Запуск сервера для разработки
    exec python -m app.identidock
elif [ "$ENV" = 'UNIT' ]; then
    echo "Running Unit Tests"
    exec python -m tests.app.test_identidock
else
    echo "Running Production Server" # Запуск сервера для эксплуатации
    exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py --callable app --stats 0.0.0.0:9191
fi