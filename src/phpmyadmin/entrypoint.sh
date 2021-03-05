# ! /bin/sh

#####
# Script Name:	entrypoint.sh
# Descrition:	Running and configuring the nginx + phpmyadmin
# Author:		amayor
#####

echo "** Create user for running nginx **"
adduser -D -g 'www' www

echo "** Make dir for phpmyadmin **"
mkdir /www

echo "** Download latest version of phpmyadmin **"
wget -c --tries=30 https://files.phpmyadmin.net/phpMyAdmin/5.1.0-rc2/phpMyAdmin-5.1.0-rc2-all-languages.tar.gz -O phpMyAdmin.tar.gz

echo "***** Unpack and remove tar *****"
tar -zxvf phpMyAdmin.tar.gz && rm -rf phpMyAdmin.tar.gz

echo "***** Move distr to /var/www *****"
mv phpMyAdmin-5.1.0-rc2-all-languages/* /www/

echo "***** Copy confg to phpMyAdmin dir *****"
cp config.inc.php /www/

echo "** Change owner for nginx distr dir and dir with phpmyadmin **"
chown -R www:www /var/lib/nginx
chown -R www:www /www

echo "** Run php-fpm7 **"
php-fpm7

echo "** Starting nginx daemon **"
nginx -g "daemon off;"