FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add openrc -- no-cache

RUN apk add mysql --no-cache
RUN apk add mysql-client --no-cache
RUN mkdir -p "/run/mysqld"
RUN chown -R mysql /run/mysqld

RUN apk add mariadb-client

COPY ./start.sh ./
COPY ./conf /etc/my.cnf
#COPY ./mysql-service.sql ./

EXPOSE 3306

CMD [ "sh", "start.sh"]
