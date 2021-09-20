FROM alpine:3.14

RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN apk add php
RUN apk add php-fpm
RUN apk add php-mysqli
RUN apk add php-json
RUN apk add php-mbstring
RUN apk add php7-redis
RUN apk add php-session
RUN apk add php-curl
RUN apk add php-zlib
RUN apk add php-gd
RUN apk add php-opcache


COPY ./wordpress-5.8.1.tar.gz /tmp/
COPY ./start.sh /
RUN tar -xvf /tmp/wordpress-5.8.1.tar.gz --strip-components 1
RUN rm -rf /tmp/latest*tar*
# RUN chown -R www-data:www-data /tmp/latest

RUN mkdir -p /run/php

# RUN sed -i 's/\/run\/php\/php7.3-fpm.sock/0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# EXPOSE 9000

CMD [ "sh", "/start.sh" ]