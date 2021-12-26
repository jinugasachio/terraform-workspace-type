#!/bin/bash

set -eo pipefail

aws_sts_credentials="$(aws sts assume-role \
  --role-arn $AWS_ADMINISTRATOR_IAM_ROLE_ARN \
  --role-session-name $ROLE_SESSION_NAME \
  --duration-seconds 900 \
  --query "Credentials" \
  --output "json")"

echo $aws_sts_credentials >> /tmp/aws_sts_credentials.json
