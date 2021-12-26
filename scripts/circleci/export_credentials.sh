#!/bin/bash

set -eo pipefail

echo 'export AWS_ACCESS_KEY_ID=$(cat /tmp/aws_sts_credentials.json | jq -r '.AccessKeyId')' >> $BASH_ENV
echo 'export AWS_SECRET_ACCESS_KEY=$(cat /tmp/aws_sts_credentials.json | jq -r '.SecretAccessKey')' >> $BASH_ENV
echo 'export AWS_SESSION_TOKEN=$(cat /tmp/aws_sts_credentials.json | jq -r '.SessionToken')' >> $BASH_ENV
