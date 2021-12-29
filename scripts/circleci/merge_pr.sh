#!/bin/bash

set -euo pipefail

PULL_REQUEST_NUMBER=${CIRCLE_PULL_REQUEST##*/}

curl \
  -X PUT \
  -H "Accept: application/vnd.github.v3+json" \
  -u $CIRCLE_PROJECT_USERNAME:$GITHUB_TOKEN \
  -d -d "{\"sha\":\"${CIRCLE_SHA1}\"}" \
  https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/pulls/$PULL_REQUEST_NUMBER/merge

