#!/bin/bash

set -eo pipefail
TARGET_DIRS=$@

for dir in $TARGET_DIRS
do
  cd $CIRCLE_WORKING_DIRECTORY/$dir
  NUMBER_OF_TF_FILES=$(find ./*.tf -type f | wc -l) # この判定は微妙。terraform.tf決めうちで良いかもしれない

  if [ $NUMBER_OF_TF_FILES -gt 0 ]; then
    tfcmt --config $CIRCLE_WORKING_DIRECTORY/tfcmt.yml -var target:$dir plan -- terraform plan -no-color
  fi
done
