# ! /bin/sh
echo "** Run setup wordpress **"
source setup_wp.sh
echo "** Run php-fpm7 **"
php-fpm7
echo "Starting nginx daemon"
nginx -g "daemon off;"
# ping 8.8.8.8