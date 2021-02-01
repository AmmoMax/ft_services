#!/bin/sh
echo "** Run setup MySQL server **"
source startup.sh &
echo "** Fix /etc/my.cnf.d/mariadb-server.cnf for access from outside the container"
sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
echo "** Install service tables in MySQL DB **"
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
echo "** Run mysqld in safe mode **"
/usr/bin/mysqld_safe --user=mysql --datadir="/var/lib/mysql"