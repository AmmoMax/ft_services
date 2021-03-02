# ! /bin/sh

# Description: Preparing influxdb and run setup

echo "** Download influxdb distr **"
wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.4-linux-amd64.tar.gz

echo "** Unpack tar archive with influxdb **"
tar xvfz influxdb2-2.0.4-linux-amd64.tar.gz

echo "** Copy binary files to /usr/local/bin **"
cp influxdb2-2.0.4-linux-amd64/influx /usr/local/bin
cp influxdb2-2.0.4-linux-amd64/influxd /usr/local/bin

echo "** Run script for setup InfluxDB **"
source setup_influxdb.sh &

echo "** Run influxd **"
influxd
