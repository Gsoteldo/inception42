#!/bin/sh

if [ "$NGINX_MODE" = "bonus" ]; then
    echo "Running Nginx in bonus mode..."
    # Usar configuración bonus
    rm -f /etc/nginx/http.d/default.conf
    mv /etc/nginx/http.d/default-bonus.conf /etc/nginx/http.d/default.conf
else
    echo "Running Nginx in default mode..."
    # Usar configuración default (ya está en su lugar)
    rm -f /etc/nginx/http.d/default-bonus.conf
fi

nginx -g 'daemon off;'