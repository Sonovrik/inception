FROM alpine:3.14

RUN apk update
RUN apk add nginx
RUN apk add openssl
RUN apk add openrc
RUN apk add openssh

RUN apk add nano
RUN apk add curl
RUN apk add net-tools

RUN mkdir /etc/nginx/ssl

COPY ./tools/* /tmp/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
   -keyout /etc/nginx/ssl/nginx-selfsigned.key \
   -out /etc/nginx/ssl/nginx-selfsigned.crt \
   -subj "/C=RU/ST=Moscow/L=Moscow/O=21/OU=school/CN=my_domain"

EXPOSE 443

CMD sh -c "ls /tmp && sh /tmp/start.sh"