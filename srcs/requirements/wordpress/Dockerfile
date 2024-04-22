FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt -y install wget
RUN mkdir /run/php/
WORKDIR /var/www/


# PHP-FPM:FastCGI Process Manager:handle PHP-based web applications.
# php-mysql : extention for intract betwen php and mysql db .
# intraction mean that queries exuye by PHP script.
# mariadb-client : CMD line tool allow usr to coonect db .
RUN apt-get install -y php-fpm php7.4-mysqli wget mariadb-client
COPY ./tools/script.sh .

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN  chmod +x ./script.sh

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm -fr latest.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 777 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


EXPOSE 9000

CMD ["bash", "script.sh"]