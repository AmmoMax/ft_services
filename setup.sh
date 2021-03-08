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
kubectl apply -f srcs/metallb/metallb-configmap.yaml

############################################################
# Now let's build all the docker images we need. See below #
############################################################

echo "** Build docker image for nginx **"
docker build -t amayor_nginx_image srcs/nginx

echo "** Build image for mysql **"
docker build -t amayor_mysql_image srcs/mysql

echo "** Build image for wordpress **"
docker build -t amayor_wordpress_image srcs/wordpress

echo "** Build image for phpmyadmin **"
docker build -t amayor_pma_image srcs/phpmyadmin

echo "** Build image for ftps server **"
docker build -t amayor_ftps_image srcs/ftps

echo "** Build image for grafana server **"
docker build -t amayor_grafana_image srcs/grafana

echo "** Build image for influxdb server **"
docker build -t amayor_influxdb_image srcs/influxdb

############################################################
# Start deploy for any logical services of the our project #
############################################################

echo "** Run deployment for nginx **"
kubectl apply -f srcs/nginx/nginx.yaml

echo "** Run deployment for mysql **"
kubectl apply -f srcs/mysql/mysql-secret.yaml
kubectl apply -f srcs/mysql/mysql-pv.yaml
kubectl apply -f srcs/mysql/mysql-pvc.yaml
kubectl apply -f srcs/mysql/mysql.yaml

echo "** Run deployment for wordpress **"
kubectl apply -f srcs/wordpress/wordpress.yaml

echo "** Run deployment for phpmyadmin **"
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

echo "** Run deployment for ftps server **"
kubectl apply -f srcs/ftps/ftps.yaml

echo "** Run deployment for the influxdb server **"
kubectl apply -f srcs/influxdb/influxdb-secret.yaml
kubectl apply -f srcs/influxdb/influxdb-pv.yaml
kubectl apply -f srcs/influxdb/influxdb-pvc.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml

echo "** Run deployment for the grafana server **"
kubectl apply -f srcs/grafana/grafana-secret.yaml
kubectl apply -f srcs/grafana/grafana.yaml