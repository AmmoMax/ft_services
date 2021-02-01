#!/bin/sh

until mysqladmin ping
do
	echo "** mysqld is not running and i going to sleep **"
	sleep 1
done

echo "**Setup my DB: create DB, create user, give him privileges! **"

echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'amayor'@'%' IDENTIFIED BY 'amayor';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'amayor'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password