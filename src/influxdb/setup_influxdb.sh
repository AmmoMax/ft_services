# ! /bin/sh

if [ -z $INFLUXDB_URL ]
then
	echo "env var INFLUXDB_URL is not set!"
	exit 1
else
	echo "INFLUXDB_URL = $INFLUXDB_URL"
fi

if [ -z $INFLUX_TOKEN ]
then
	echo "env var INFLUX_TOKEN is not set!"
	exit 1
else
	echo "INFLUX_TOKEN = $INFLUX_TOKEN"
fi

echo "** Creating InfluxDB config **"
# influx config create --active -n ft_services -u $INFLUXDB_URL -t $INFLUX_TOKEN -o ft_services

until influx ping
do
	echo "** influxd is not ready.. **"
	sleep 1
done

influx setup --org ft_services --bucket telegraf --host http://172.17.0.2:8086 --username amayor --password amayor1234 -t "Qq_YHXnShisgcLB6M1pasbc1oeBNHwnKFvqZGr5I1pU3XifMJk8WDBjsfEw7q-pzWdsXkhQE-ABywtaIPw0JSQ==" --force