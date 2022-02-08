#!/bin/bash

set -euo pipefail

TARGET_DIRS=$@
export REVIEWDOG_GITHUB_API_TOKEN=$GITHUB_TOKEN
echo $TARGET_DIRS | xargs -r -n 1 bash -c 'cd $CIRCLE_WORKING_DIRECTORY/$0 && tflint --config $CIRCLE_WORKING_DIRECTORY/.tflint.hcl --format=checkstyle | reviewdog -f=checkstyle -name="tflint" -reporter=github-pr-review -fail-on-error=true'
