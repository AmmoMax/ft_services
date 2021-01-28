#! /bin/bash
echo "***** Starting mysql service ****"
service mysql start

echo "***** Starting setting database ****"
mysql -u root <<MY_QUERY
CREATE DATABASE amayor_db;
CREATE USER amayor@localhost IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON amayor_db.* TO amayor@localhost IDENTIFIED BY '123';
MY_QUERY