FROM alpine:3.19

RUN apk add --no-cache \
    mariadb \
    mariadb-client \
    bash

# Crear directorios necesarios y establecer permisos
RUN mkdir -p /var/run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql

COPY 50-server.cnf /etc/my.cnf.d/50-server.cnf
COPY ./tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

EXPOSE 3306

CMD ["/setup.sh"]