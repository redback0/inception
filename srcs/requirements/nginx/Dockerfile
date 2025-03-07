
FROM alpine:3.21.3

RUN apk update && apk upgrade && apk add nginx openssl

COPY configs/nginx.conf /etc/nginx/http.d/nginx.conf

# RUN printf "daemon off;\n`cat nginx.conf`" > nginx.conf
RUN printf "daemon off;\nerror_log /dev/stdout debug;\n" >> /etc/nginx/nginx.conf

EXPOSE 443

COPY scripts/init-nginx.sh /bin/init-nginx.sh

RUN chmod +xt /bin/init-nginx.sh

CMD ["/bin/init-nginx.sh"]
