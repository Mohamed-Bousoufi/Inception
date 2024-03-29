#!/bin/bash
mkdir -p /var/run/mysqld/
mkdir -p run/mysqld/
chown mysql:mysql -R /var/run/mysqld
chown mysql:mysql -R run/mysqld
mysql_install_db
service mariadb start
commands="CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;"
echo "$commands" | mysql -u root
service mariadb stop
mysqld







