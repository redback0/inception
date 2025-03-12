
FROM alpine:3.21.3

# install mariadb
RUN apk add mariadb

# install database
RUN mkdir -p /var/mariadb && cd /var/mariadb && mariadb-install-db
# own database
RUN chown -R mysql:root /var/mariadb

# make sure a socket can be created
RUN mkdir -p /run/mysqld && chown -R mysql:root /run/mysqld

# initialize database (RUN SQL SCRIPT?)

CMD [ "mariadbd-safe" "--datadir=/var/mariadb/data" "--user=mysql" ]
