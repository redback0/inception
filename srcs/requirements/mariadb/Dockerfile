
FROM alpine:3.21.3

# install mariadb
RUN apk add mariadb mariadb-client

# install database
RUN mkdir -p /var/mariadb && cd /var/mariadb && mariadb-install-db
# own database
RUN chown -R mysql:root /var/mariadb

# make sure a socket can be created
RUN mkdir -p /run/mysqld && chown -R mysql:root /run/mysqld

# allow external connections
RUN sed -i "s/skip-networking//g" /etc/my.cnf.d/mariadb-server.cnf

COPY scripts /run/scripts
RUN chmod +xt /run/scripts/*

CMD [ "/run/scripts/init-db.sh" ]
