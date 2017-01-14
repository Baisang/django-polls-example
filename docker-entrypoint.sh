#!/bin/bash
set -e

timestamp() {
    until ping -q -c1 localhost > /dev/null 2>&1; do
        sleep 0.5
    done
    date -u +%s > /tmp/boot_timestamp
}
timestamp &

echo "Starting server..."
exec gunicorn -w 4 -b 0.0.0.0:80 mysite.wsgi "$@"

