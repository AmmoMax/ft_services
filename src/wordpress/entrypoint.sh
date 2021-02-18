# ! /bin/sh

#####
# Script Name:	entrypoint.sh
# Descrition:	Run setup script for wordpress and startind daemon for php-fpm and nginx
# Author:		amayor
#####

echo "** Run setup wordpress **"
source setup_wp.sh

echo "** Run php-fpm7 **"
php-fpm7

echo "** Starting nginx daemon **"
nginx -g "daemon off;"