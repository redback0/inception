#!/bin/sh

if [ ! -f /var/www/html/wp-config.php ]; then

    echo "--FIRST RUN--"

    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

    set -a && source /run/secrets/database.env && \
        source /run/secrets/wordpress.env && \
        source /run/secrets/nginx.env && set +a
    DB_HOST=inception-mariadb

    sed -i "s/database_name_here/${DB_NAME}/" /var/www/html/wp-config.php
    sed -i "s/username_here/${DB_USER}/" /var/www/html/wp-config.php
    sed -i "s/password_here/${DB_PASSWORD}/" /var/www/html/wp-config.php
    sed -i "s/localhost/${DB_HOST}/" /var/www/html/wp-config.php

    php82 /run/wp-cli.phar core install \
        --path="/var/www/html/" \
        --url="${INTRA_ID}.42.fr" \
        --title="Incpetion" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASS}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --skip-email

fi

exec php-fpm82 -F
