#!/bin/bash

WP_PATH=/var/www/html

cd $WP_PATH

sed -i 's/\/run\/php\/php7\.4-fpm\.sock/wordpress:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

wp core download --allow-root --path=$WP_PATH

wp config create --allow-root --path=$WP_PATH\
    --dbname=$MARIADB_DATABASE\
    --dbuser=$MARIADB_USER\
    --dbpass=$MARIADB_PASSWD\
    --dbhost=$MARIADB_HOST

wp core install --allow-root --path=$WP_PATH\
  --url=$DOMAIN_NAME\
  --title=$WORDPRESS_TITLE\
  --admin_user=$WORDPRESS_ADMIN\
  --admin_password=$WORDPRESS_PASSWD\
  --admin_email=$WORDPRESS_EMAIL

wp user create --allow-root --path=$WP_PATH\
  $WORDPRESS_USER $WORDPRESS_USER_EMAIL\
  --user_pass=$WORDPRESS_USER_PASSWD\
  --role=author

php-fpm7.4 -F -R
