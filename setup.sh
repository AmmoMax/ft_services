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

############################################################
# Start deploy for any logical services of the our project #
############################################################

echo "** Run deployment for nginx **"
kubectl apply -f src/nginx/nginx.yaml

echo "** Run deployment for mysql **"
kubectl apply -f src/mysql/mysql-secret.yaml
kubectl apply -f src/mysql/mysql.yaml

echo "** Run deployment for wordpress **"
kubectl apply -f src/wordpress/wordpress.yaml
