#! /bin/bash

echo "***** Starting wordpress download and setting ****"
adduser -D -g 'www' www
wget https://ru.wordpress.org/latest-ru_RU.tar.gz -O wordpress.tar.gz
mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www && mkdir -p /run/nginx
tar -xvf wordpress.tar.gz && mv wordpress /www/
rm -f wordpress.tar.gz
# chmod 775 /www/wordpress/
chown -R www: /www/wordpress

echo "***** Copy wp-config.php to /www/wordpress/ ****"
cp wp-config.php /www/wordpress/