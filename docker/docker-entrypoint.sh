#!/bin/bash

readonly APP_CONFIG_DIR=/app
readonly APP_CONFIG_FILE=${APP_CONFIG_DIR}/config.php
readonly APP_CONFIG_EQ_FILE=${APP_CONFIG_DIR}/config.sample.php

readonly PHP_INI=/opt/bitnami/php/lib/php.ini

function update_config () {
    if [ -n "$2" ]; then
        echo "update ENV $1 to $2"
        sed -i "s?'$1',.*\$?'$1', '$2');?" "$APP_CONFIG_FILE"
    fi
}

if [ ! -f "$APP_CONFIG_FILE" ]; then
    echo "no config file, use sample config"
    cp "$APP_CONFIG_EQ_FILE" "$APP_CONFIG_FILE"
    sed -i "s?'SITE_DOMAIN',.*\$?'SITE_DOMAIN', '');?" "$APP_CONFIG_FILE"

    update_config 'MYSQL_HOST' "$MYSQL_HOST"
    update_config 'MYSQL_USER_NAME' "$MYSQL_USER_NAME"
    update_config 'MYSQL_USER_PASSWORD' "$MYSQL_USER_PASSWORD"
    update_config 'MYSQL_DB_NAME' "$MYSQL_DB_NAME"
    update_config 'MYSQL_CHARSET' "$MYSQL_CHARSET"
    update_config 'SMTP_SERVER_HOST' "$SMTP_SERVER_HOST"
    update_config 'SMTP_SERVER_PORT' "$SMTP_SERVER_PORT"
    update_config 'SMTP_SERVER_EMAIL' "$SMTP_SERVER_EMAIL"
    update_config 'SMTP_SERVER_USER' "$SMTP_SERVER_USER"
    update_config 'SMTP_SERVER_PASS' "$SMTP_SERVER_PASS"
fi

sed -i 's?^error_reporting.*?error_reporting = E_ALL \& \~E_DEPRECATED \& \~E_STRICT \& \~E_NOTICE?' "$PHP_INI"
sed -i 's?^opcache.revalidate_freq.*?opcache.revalidate_freq = 0?' "$PHP_INI"
/app/install.sh 
nginx -t && nginx

exec "$@"