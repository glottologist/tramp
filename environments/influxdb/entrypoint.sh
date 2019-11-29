
#!/bin/bash

set -m
CONFIG_FILE="/etc/influxdb/influxdb.conf"
PASS=${INFLUXDB_ADMIN_PASSWORD:-admin}
ADMIN_CREATED="/var/lib/influxdb/.admin_created"
DB_CREATED="/var/lib/influxdb/.db_created"

echo "InfluxDB configuration: "
cat ${CONFIG_FILE}
echo "=> Starting InfluxDB ..."
exec influxd -config=${CONFIG_FILE} &

#wait for the startup of influxdb
RET=1
while [[ RET -ne 0 ]]; do
echo "=> Waiting for confirmation of InfluxDB service startup ..."
sleep 3
curl -k http://database1.internal.fraxses.com:8086/ping 2> /dev/null
RET=$?
done
echo ""
