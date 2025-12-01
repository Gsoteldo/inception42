#!/bin/sh

if [ "$NGINX_MODE" = "bonus" ]; then
    cp -f /etc/nginx/http.d/default-bonus.conf /etc/nginx/http.d/default.conf
    echo "Running Nginx in bonus mode..."
    rm -f /etc/nginx/http.d/default-bonus.conf
else
    cp -f /etc/nginx/http.d/default.conf /etc/nginx/http.d/default.conf
    echo "Running Nginx in default mode..."
    rm -f /etc/nginx/http.d/default-bonus.conf
fi

nginx -g 'daemon off;'