#!/bin/bash

set -eo pipefail

TARGET_DIRS=$@
echo $TARGET_DIRS | xargs -r -n 1 bash -c 'cd $CIRCLE_WORKING_DIRECTORY/$0 && terraform validate'
