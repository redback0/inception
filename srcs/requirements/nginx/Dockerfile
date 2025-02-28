FROM alpine:3.21.3

RUN apk update && apk upgrade && apk add nginx

COPY configs/nginx.conf /etc/nginx/http.d/nginx.conf

ENV INTRA_ID njackson
RUN apk add openssl && openssl req -newkey rsa:2048 -noenc\
        -keyout /etc/ssl/inception_private_key.key -x509 -days 365\
        -out /etc/ssl/certs/inception_certificate.csr\
        -subj '/CN='${INTRA_ID}'.42.fr'


EXPOSE 443

CMD ["nginx"]
