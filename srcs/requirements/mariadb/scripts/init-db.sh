#!/bin/sh

first_run()
{
    echo "--FIRST RUN--"
    sleep 5

    set -a && source /run/secrets/wordpress.env \
        && source /run/secrets/database.env && set +a

    WP_HOST=inception-wordpress.srcs_wordpress-network

    sed -i "s/DB_NAME/$DB_NAME/g" /run/scripts/init-db.sql
    sed -i "s/DB_USER/$DB_USER/g" /run/scripts/init-db.sql
    sed -i "s/DB_PASSWORD/$DB_PASSWORD/g" /run/scripts/init-db.sql
    sed -i "s/WP_HOST/$WP_HOST/g" /run/scripts/init-db.sql

    mariadb < /run/scripts/init-db.sql
}

FIRST_RUN_FILE=/etc/first_run_file

if [ ! -f $FIRST_RUN_FILE ]; then
    touch $FIRST_RUN_FILE

    first_run &
fi

exec mariadbd --datadir=/var/mariadb/data --user=mysql
