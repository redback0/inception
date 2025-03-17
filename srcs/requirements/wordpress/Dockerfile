
FROM alpine:3.21.3

# install php-fpm and other php requirements
RUN apk update && apk add \
        php82 \
        php82-fpm \
        php82-iconv \
        php82-phar \
        php82-mysqli

# get wordpress
#RUN apk add curl && \
#    mkdir -p /var/www/html/
# RUN apk add curl &&\
#     mkdir -p /var/www/html/ &&\
#     cd /var/www/html/ &&\
#     curl --output wordpress.tar.gz https://wordpress.org/wordpress-6.7.2.tar.gz &&\

ADD https://wordpress.org/wordpress-6.7.2.tar.gz /tmp/wordpress.tar.gz
RUN tar -xzvC /var/www/html/ -f /tmp/wordpress.tar.gz >/dev/null &&\
    mkdir -p /var/www/html/ &&\
    mv /tmp/wordpress/* /var/www/html/ &&\
    rm -rf /tmp/wordpress.tar.gz /tmp/wordpress

# configure php-fpm
RUN printf 'access.log = /dev/stdout\n[global]\nerror_log = /dev/stderr\n' >> /etc/php82/php-fpm.conf
# listen to all servers
RUN sed -i "s/listen = 127\.0\.0\.1\:9000/listen = 9000/" /etc/php82/php-fpm.d/www.conf

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /run/wp-cli.phar

COPY scripts/init-docker.sh /bin/init-docker.sh
RUN chmod +xt /bin/init-docker.sh

CMD [ "/bin/init-docker.sh" ]
