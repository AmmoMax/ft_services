# ! /bin/sh

# Description: rebuild image and start local container with Grafana

echo "** Rebuild image for Grafana container **"
docker build -t amayor_grafana_image .

echo "** Run container with InfluxDB **"
docker run --rm -d --env INFLUXDB_URL=http://172.17.0.2:8086 --env INFLUX_TOKEN="Qq_YHXnShisgcLB6M1pasbc1oeBNHwnKFvqZGr5I1pU3XifMJk8WDBjsfEw7q-pzWdsXkhQE-ABywtaIPw0JSQ==" -p 3000:3000 --name amayor_grafana_container amayor_grafana_image