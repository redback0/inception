
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
RUN apk add php82-fpm php82-mysqli php82 php82-phar

# configure php-fpm
RUN printf 'access.log = /dev/stdout\n[global]\nerror_log = /dev/stderr\n' >> /etc/php82/php-fpm.conf
# listen to all servers
RUN sed -i "s/listen = 127\.0\.0\.1\:9000/listen = 9000/" /etc/php82/php-fpm.d/www.conf

COPY scripts/init-docker.sh /bin/init-docker.sh
RUN chmod +xt /bin/init-docker.sh

CMD [ "/bin/init-docker.sh" ]
