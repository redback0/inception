#!/bin/sh

if [ ! -f /etc/ssl/certs/inception_certificate.csr ]; then

    #INTRA_ID=$(cat /run/secrets/INTRA_ID)
    set -a && source /run/secrets/.env && set +a

    openssl req -newkey rsa:2048 -noenc\
        -keyout /etc/ssl/inception_private_key.key -x509 -days 365\
        -out /etc/ssl/certs/inception_certificate.csr\
        -subj '/CN='${INTRA_ID}'.42.fr'

    sed -i "s/INTRA_ID/${INTRA_ID}/g" /etc/nginx/http.d/nginx.conf

fi

exec nginx
