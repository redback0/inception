FROM alpine:3.21.3

RUN apk update && apk upgrade && apk add nginx

COPY configs/nginx.conf /etc/nginx/http.d/nginx.conf

# RUN printf "daemon off;\n`cat nginx.conf`" > nginx.conf
RUN printf "daemon off;\nerror_log /dev/stdout debug;\n" >> /etc/nginx/nginx.conf

# this should be set as a docker secret
ENV INTRA_ID njackson

# this needs to move to first run of the container
RUN apk add openssl && openssl req -newkey rsa:2048 -noenc\
        -keyout /etc/ssl/inception_private_key.key -x509 -days 365\
        -out /etc/ssl/certs/inception_certificate.csr\
        -subj '/CN='${INTRA_ID}'.42.fr'
# this also should be moved to first run
RUN sed -i "s/INTRA_ID/${INTRA_ID}/g" /etc/nginx/http.d/nginx.conf

EXPOSE 443

CMD ["nginx"]
