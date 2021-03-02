# ! /bin/sh

# Description: rebuild image and start local container with InfluxDB

echo "** Rebuild image for InfluxDB container **"
docker build -t amayor_influxdb_image .

echo "** Run container with InfluxDB **"
docker run --rm -d -v /var/run/docker.sock:/var/run/docker.sock --env INFLUXDB_URL=http://172.17.0.2:8086 --env INFLUX_TOKEN="Qq_YHXnShisgcLB6M1pasbc1oeBNHwnKFvqZGr5I1pU3XifMJk8WDBjsfEw7q-pzWdsXkhQE-ABywtaIPw0JSQ==" -p 8086:8086 --name amayor_influxdb_container amayor_influxdb_image