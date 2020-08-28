FROM mysql:5.7
COPY init.sql /docker-entrypoint-initdb.d/

ARG MYSQL_CONTAINER_USER
ARG MYSQL_CONTAINER_GROUP
ARG MYSQL_IP

COPY mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf


RUN usermod -u 1000 ${MYSQL_CONTAINER_USER} \
&& groupmod -g 1000 ${MYSQL_CONTAINER_GROUP}




