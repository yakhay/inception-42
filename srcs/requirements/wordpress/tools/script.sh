#!/bin/bash

sleep 10

wp config create	--allow-root \
    --dbname=$DATABASE \
    --dbuser=$ADMIN  \
    --dbpass=$PASS_ADMIN  \
    --dbhost=mariadb:3306 \
    --path='/var/www/wordpress'
    
# WordPress installation
wp core install --allow-root \
    --url=$URL_WP \
    --title=$TITLE_WP \
    --admin_user="$ADMIN " \
    --admin_password="$PASS_ADMIN " \
    --admin_email=$ADM_EMILE_WW\
    --path="/var/www/wordpress" --skip-email

wp user create  $USER_NORMAL\
    $EMAIL_NRML_USER\
    --role=subscriber\
    --user_pass="$PASS"\
    --path="/var/www/wordpress"\
    --allow-root

cd /var/www/wordpress
wp theme install minimalistblogger --activate --allow-root


exec php-fpm7.4 -F