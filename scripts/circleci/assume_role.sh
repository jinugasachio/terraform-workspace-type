#!/bin/bash

set -eo pipefail

aws_sts_credentials="$(aws sts assume-role \
  --role-arn $AWS_ADMINISTRATOR_IAM_ROLE_ARN \
  --role-session-name $ROLE_SESSION_NAME \
  --duration-seconds 900 \
  --query "Credentials" \
  --output "json")"

cat <<EOT > "aws_sts_credentials.sh"
echo 'export AWS_ACCESS_KEY_ID=$(echo $aws_sts_credentials | jq -r '.AccessKeyId')' >> $BASH_ENV
echo 'export AWS_SECRET_ACCESS_KEY=$(echo $aws_sts_credentials | jq -r '.SecretAccessKey')' >> $BASH_ENV
echo 'export AWS_SESSION_TOKEN=$(echo $aws_sts_credentials | jq -r '.SessionToken')' >> $BASH_ENV
EOT
