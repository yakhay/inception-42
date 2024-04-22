
FROM debian:bullseye

RUN apt -y update && apt -y upgrade
RUN apt install -y nginx 
RUN apt install -y openssl 

RUN mkdir -p /etc/nginx/ssl 



RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/yakhay.crt \
    -keyout /etc/nginx/ssl/yakhay.key \
    -subj "/" 

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default.conf

CMD [ "nginx", "-g", "daemon off;" ]
