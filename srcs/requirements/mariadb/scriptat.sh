#!/bin/bash

sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
mariadb -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWD';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';"
mariadb -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

mysqld
# mariadbd
