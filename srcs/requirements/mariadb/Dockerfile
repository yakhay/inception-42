FROM debian:bullseye

RUN apt-get update  && apt-get upgrade -y

RUN apt-get install mariadb-server -y

COPY ./conf/50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /var/script.sh 

RUN chmod 0777 /var/script.sh

EXPOSE 3306

CMD ["/var/script.sh"]