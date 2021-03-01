# ! /bin/sh

wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.4-linux-amd64.tar.gz

tar xvfz influxdb2-2.0.4-linux-amd64.tar.gz

cp influxdb2-2.0.4-linux-amd64/influx /usr/local/bin
cp influxdb2-2.0.4-linux-amd64/influxd /usr/local/bin

source setup_influxdb.sh &

influxd
