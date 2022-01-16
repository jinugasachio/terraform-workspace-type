#!/bin/bash

set -euo pipefail

curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v0.6.0/aqua-installer | bash -s -- -v v0.10.0
