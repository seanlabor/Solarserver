#!/bin/bash

# Load environment variables
set -o allexport
source .env
set +o allexport

echo "Waiting for InfluxDB to be ready..."
until curl -s http://192.168.178.98:8086/health | grep '"status":"pass"' > /dev/null; do
  sleep 2
done

echo "InfluxDB is healthy, creating additional buckets..."

# Create extra buckets
influx bucket create --name Sungather_SG12RG --org Solar --token 

echo "Buckets created!"
