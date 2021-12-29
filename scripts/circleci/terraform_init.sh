#!/bin/bash

set -eo pipefail

TARGET_DIRS=$@
CONFIG_FILE="terraform.tf"

for dir in $TARGET_DIRS
do
  cd $CIRCLE_WORKING_DIRECTORY/$dir
  if [ -e $CONFIG_FILE ]; then
    terraform init -input=false -no-color
  fi
done
