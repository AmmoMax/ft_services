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

until influx ping
do
	echo "** influxd is not ready.. **"
	sleep 1
done

echo "** Creating InfluxDB config **"
influx setup --org ft_services --bucket telegraf --host $INFLUXDB_URL --username amayor --password amayor1234 -t $INFLUX_TOKEN --force