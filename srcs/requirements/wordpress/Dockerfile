

# FROM wordpress:6.7.1-fpm

# ENV WORDPRESS_DB_HOST mariadb
# ENV WORDPRESS_DB_USER a_user
# ENV WORDPRESS_DB_PASSWORD a_password
# ENV WORDPRESS_DB_NAME wordpress_db

FROM alpine:3.21.3

RUN apk update && apk upgrade

# get wordpress
RUN apk add curl &&\
mkdir -p /var/www/html/ &&\
cd /var/www/html/ &&\
curl --output wordpress.tar.gz https://wordpress.org/wordpress-6.7.2.tar.gz &&\
tar -xzvf wordpress.tar.gz &&\
rm wordpress.tar.gz &&\
mv wordpress/* . &&\
rm -r wordpress


# install php-fpm
RUN apk add php82-fpm php82-mysqli

# configure php-fpm
RUN printf 'access.log = /dev/stdout\nerror_log = /dev/stderr'

CMD [ "php-fpm82", "-F" ]
