#!/bin/bash

set -e

mkdir -p /secret
echo $GOOGLE_AUTH_JSON > /secret/google-auth.json

cloud_sql_proxy \
  -credential_file=/secret/google-auth.json \
  -instances=$INSTANCE_NAME \
  -dir=/cloudsql
