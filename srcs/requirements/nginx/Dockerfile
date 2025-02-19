FROM alpine:3.21.3
RUN apk add nginx

COPY nginx.conf /etc/nginx/nginx.conf

RUN apk add openssl
# && openssl req -newkey rsa:2048 -noenc\
#         -keyout /etc/openssl/certs/inception_private_key.key -x509 -days 365\
#         -out /etc/openssl/certs/inception_certificate.csr\
#         -subj '/CN=njackson.42.fr'

