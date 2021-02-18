#! /bin/bash

#####
# Script Name:	setup_wp.sh
# Descrition:	Download and setup wordpress
# Author:		amayor
#####

echo "** Creating user for nginx **"
adduser -D -g 'www' www

echo "** Download latest wordpress version **"
wget https://ru.wordpress.org/latest-ru_RU.tar.gz -O wordpress.tar.gz

echo "** Make dir for wordpress **"
mkdir /www

echo "** Change owner for dir with nginx stuff and wordpress **"
chown -R www:www /var/lib/nginx
chown -R www:www /www

echo "** Unpack archive with wordpress and move **"
tar -xvf wordpress.tar.gz && mv wordpress /www/

echo "** Some clean... **"
rm -f wordpress.tar.gz

echo "** Copy wp-config.php to /www/wordpress/ **"
cp wp-config.php /www/wordpress/