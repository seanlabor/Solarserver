#!/bin/bash

echo "Waiting for InfluxDB to be ready..."
until curl -s http://192.168.178.98:8086/health | grep '"status":"pass"' > /dev/null; do
  sleep 2
done


echo "InfluxDB is healthy, creating additional buckets..."

# Login
INFLUX_TOKEN=$(cat /var/lib/influxdb2/docker-configs/docker-config.toml | grep -oP '(?<=token = ")[^"]+')

# Create extra buckets
influx bucket create --name Sungather_SG12RG --org ${Solar} --token $INFLUX_TOKEN

echo "Buckets created!"