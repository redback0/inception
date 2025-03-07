#!/bin/sh

if [ ! -f /var/www/html/wp-config.php ]; then

    echo "--FIRST RUN--"

    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

    #DB_NAME=$(cat /run/secrets/DB_NAME)
    #DB_USER=$(cat /run/secrets/DB_USER)
    #DB_PASSWORD=$(cat /run/secrets/DB_PASSWORD)
    DB_HOST=inception-mariadb
    set -a && source /run/secrets/.env && set +a

    sed -i "s/database_name_here/${DB_NAME}/" /var/www/html/wp-config.php
    sed -i "s/username_here/${DB_USER}/" /var/www/html/wp-config.php
    sed -i "s/password_here/${DB_PASSWORD}/" /var/www/html/wp-config.php
    sed -i "s/localhost/${DB_HOST}/" /var/www/html/wp-config.php

fi

exec php-fpm82 -F
