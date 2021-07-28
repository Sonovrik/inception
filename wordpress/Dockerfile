FROM alpine:3.14

RUN apk update
RUN apk upgrade
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
    php7-zlib php7-curl php7-mbstring php7-json php7-session \
    openrc nginx php-fpm


ADD https://wordpress.org/latest.tar.gz /tmp
RUN tar -xvf /tmp/latest*tar* --strip-components 1
RUN rm -rf /tmp/latest*tar*


COPY ./tools/* /tmp/

EXPOSE 9000

CMD sh -c "ls /tmp && sh /tmp/start.sh"