# ! /bin/sh

# Description: Сheck whether influxd is running and configure it

echo "** Check INFLUXDB_URL environment variable **"
if [ -z $INFLUXDB_URL ]
then
	echo "env var INFLUXDB_URL is not set!"
	exit 1
else
	echo "INFLUXDB_URL = $INFLUXDB_URL"
fi

echo "** Check INFLUX_TOKEN environment variable **"
if [ -z $INFLUX_TOKEN ]
then
	echo "env var INFLUX_TOKEN is not set!"
	exit 1
else
	echo "INFLUX_TOKEN = $INFLUX_TOKEN"
fi

echo "** Check the influx starting **"
until influx ping
do
	echo "** influxd is not ready.. **"
	sleep 1
done

echo "** Creating InfluxDB config **"
influx setup --org ft_services --bucket telegraf --host $INFLUXDB_URL --username amayor --password amayor1234 -t $INFLUX_TOKEN --force

echo "** Running the telegraph installation and configuration script **"
sh setup_telegraf.sh