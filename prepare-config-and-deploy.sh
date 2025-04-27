#!/bin/bash

echo ">> Preparing SolarGather config.yaml with environment variables..."
export $(cat .env | xargs)
envsubst < solargather_SG12RG/config.template.yaml > solargather_SG12RG/config.yaml
envsubst < solargather_SG4RG/config.template.yaml > solargather_SG4RG/config.yaml
envsubst < .github\workflows\deploy.template.yaml > .github\workflows\deploy.yaml


line65=$(sed -n '38p' solargather_SG12RG/config.yaml)
echo "THis should contain a full url: $line65"


# ensure all host config dirs exist
for d in homeassistant influxdb mosquitto solargather_SG4RG solargather_SG12RG; do
  DIR="/docker-static-config-data/$d"
  if [ ! -d "$DIR" ]; then
    echo "Creating host directory $DIR"
    mkdir -p "$DIR"
    chown florian:florian "$DIR"
  fi
done

echo "🚀 Bringing up Docker containers..."
docker compose up -d