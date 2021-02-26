# ! /bin/sh

#####
# Script Name:	entrypoint.sh
# Descrition:	Running and configuring Grafana server
# Author:		amayor
#####

echo "** Running grafana-server with params **"
/usr/sbin/grafana-server --config=/etc/grafana.ini --homepath=/usr/share/grafana