FROM alpine:3.14

RUN apk update
RUN apk upgrade
# RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
#     php7-zlib php7-curl php7-mbstring php7-json php7-session \
#     openrc nginx php7-redis php-fpm
RUN apk add php
RUN apk add php-fpm
RUN apk add php-mysqli
RUN apk add php-json
RUN apk add php-mbstring
RUN apk add php7-redis
RUN apk add wget


ADD https://wordpress.org/latest.tar.gz /tmp
RUN tar -xvf /tmp/latest*tar* --strip-components 1
RUN rm -rf /tmp/latest*tar*
# RUN chown -R www-data:www-data /tmp/latest
COPY ./start.sh /tmp/

RUN mkdir -p /run/php

# RUN sed -i 's/\/run\/php\/php7.3-fpm.sock/0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# EXPOSE 9000

CMD [ "sh", "/tmp/start.sh" ]