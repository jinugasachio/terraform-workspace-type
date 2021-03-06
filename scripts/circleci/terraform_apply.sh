#!/bin/bash

set -euo pipefail

TARGET_DIRS=$@
CONFIG_FILE="terraform.tf"

for dir in $TARGET_DIRS
do
  cd $CIRCLE_WORKING_DIRECTORY/$dir
  if [ -e $CONFIG_FILE ]; then
    tfcmt --config $CIRCLE_WORKING_DIRECTORY/tfcmt.yml -var target:$dir apply -- terraform apply -no-color -auto-approve
  fi
done
