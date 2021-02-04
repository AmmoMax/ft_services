#!/bin/sh

until mysqladmin ping
do
	echo "** mysqld is not running and i going to sleep **"
	sleep 1
done

echo "**Setup my DB: create DB, create user, give him privileges! **"

echo "CREATE DATABASE $DB_NAME;" | mysql -u root --skip-password
echo "CREATE USER '$USER_NAME'@'%' IDENTIFIED BY '$USER_PASSWORD';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USER_NAME'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password