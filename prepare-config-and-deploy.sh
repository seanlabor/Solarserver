#!/bin/bash

echo ">> Preparing SolarGather config.yaml with environment variables..."
export $(cat .env | xargs) # lädt alle Variablen
envsubst < solargather_SG12RG/config.template.yaml > solargather_SG12RG/config.yaml
envsubst < solargather_SG4RG/config.template.yaml > solargather_SG4RG/config.yaml

echo "🚀 Bringing up Docker containers..."
docker compose up -d