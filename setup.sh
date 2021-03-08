#!/bin/bash

#####
# Script Name:	setup.sh
# Descrition:	Full launch of the training cluster in kubernetes
#				with services: grafana, wordress, nginx(proxy and
#				reverse proxy), PhpMyAdmin, FTPS, MySQL, InfluxDB
# Author:		amayor
#####

echo "** Start minilube cluster **"
minikube start

echo "** Enable metric-server addon for minikube **"
minikube addons enable metrics-server

echo "** Enable dashboard addon for minikube **"
minikube addons enable dashboard

echo "** Enable metallb addon for minikube **"
minikube addons enable metallb

echo "** Configure environment to use minikube’s Docker daemon **"
eval $(minikube docker-env)

echo "** Deploy configmap for metallb **"
kubectl apply -f src/metallb/metallb-configmap.yaml

############################################################
# Now let's build all the docker images we need. See below #
############################################################

echo "** Build docker image for nginx **"
docker build -t amayor_nginx_image src/nginx

echo "** Build image for mysql **"
docker build -t amayor_mysql_image src/mysql

echo "** Build image for wordpress **"
docker build -t amayor_wordpress_image src/wordpress

echo "** Build image for phpmyadmin **"
docker build -t amayor_pma_image src/phpmyadmin

echo "** Build image for ftps server **"
docker build -t amayor_ftps_image src/ftps

echo "** Build image for grafana server **"
docker build -t amayor_grafana_image src/grafana

echo "** Build image for influxdb server **"
docker build -t amayor_influxdb_image src/influxdb

############################################################
# Start deploy for any logical services of the our project #
############################################################

echo "** Run deployment for nginx **"
kubectl apply -f src/nginx/nginx.yaml

echo "** Run deployment for mysql **"
kubectl apply -f src/mysql/mysql-secret.yaml
kubectl apply -f src/mysql/mysql-pv.yaml
kubectl apply -f src/mysql/mysql-pvc.yaml
kubectl apply -f src/mysql/mysql.yaml

echo "** Run deployment for wordpress **"
kubectl apply -f src/wordpress/wordpress.yaml

echo "** Run deployment for phpmyadmin **"
kubectl apply -f src/phpmyadmin/phpmyadmin.yaml

echo "** Run deployment for ftps server **"
kubectl apply -f src/ftps/ftps.yaml

echo "** Run deployment for the influxdb server **"
kubectl apply -f src/influxdb/influxdb-secret.yaml
kubectl apply -f src/influxdb/influxdb-pv.yaml
kubectl apply -f src/influxdb/influxdb-pvc.yaml
kubectl apply -f src/influxdb/influxdb.yaml

echo "** Run deployment for the grafana server **"
kubectl apply -f src/grafana/grafana-secret.yaml
kubectl apply -f src/grafana/grafana.yaml