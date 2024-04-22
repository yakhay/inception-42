#!/bin/sh

service mariadb start

sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DATABASE}\`;"

mariadb -e "CREATE USER IF NOT EXISTS \`${ADMIN}\`@'%' IDENTIFIED BY '${PASS_ADMIN}';"

mariadb -e "GRANT ALL PRIVILEGES ON \`${DATABASE}\`.* TO \`${ADMIN}\`@'%' IDENTIFIED BY '${PASS_ADMIN}';"


mariadb -u root -p${ROOT_PASS} -e "GRANT ALL PRIVILEGES ON \`${DATABASE}\`.* TO 'root'@'%' IDENTIFIED BY '${ROOT_PASS}';"

mariadb -e "FLUSH PRIVILEGES;"

mysqladmin shutdown

mysqld_safe


