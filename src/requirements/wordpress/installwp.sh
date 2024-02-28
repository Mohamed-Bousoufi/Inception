#!/bin/bash


#download wp-cli
if [ ! -d /usr/local/bin/wp ]; then

        curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        chmod +x wp-cli.phar
        mv wp-cli.phar /usr/local/bin/wp
else
    echo "wordpress already downloaded ....."
fi

if [ ! -d var/www/html ]; then
    mkdir -p /var/www/html/

    chown -R www-data:www-data /var/www/html/
    chown www-data:www-data /var/www/html/
fi

cd /var/www/html/

wp core download --allow-root
if [ ! -f var/www/html/wp-config.php ]; then
        wp config create --dbname=$DB_NAME --dbhost=$DB_HOST --dbuser=$DB_USER --dbpass=$DB_PASSWORD --allow-root
        wp core install --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD  --admin_email=$ADMIN_EMAIL --allow-root
        wp user create $USER_LOG $USER_EML --role=$ROLE --user_pass=$USER_PASS  --allow-root
fi

php-fpm7.4 -F --fpm-config=/etc/php7.4/fpm/pool.d/www.conf