#!/bin/bash
set -euo pipefail

# This script runs ONCE, after the built-in setup.
# It is idempotent: if the bucket already exists, nothing happens.

CLI_TOKEN="${INFLUXDB_INIT_TOKEN}"
ORG="${INFLUXDB_ORG}"

if ! influx bucket list -o "$ORG" -t "$CLI_TOKEN" | grep -q '^Sungather_SG12RG'; then
  echo "Creating bucket Sungather_SG12RG …"
  influx bucket create \
        --name Sungather_SG12RG \
        --org "$ORG" \
        --token "$CLI_TOKEN"
else
  echo "Bucket Sungather_SG12RG already present – skipping"
fi
