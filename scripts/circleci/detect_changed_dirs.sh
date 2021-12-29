#!/bin/bash

set -euo pipefail

# 差分のあるファイルのディレクトリを一意に取得する
git --no-pager diff origin/main..HEAD --name-only  | xargs -I{} dirname {} | awk '!a[$0]++{print}'

# TODO: main直pushだと差分を検出できないので条件分岐で処理を書く必要がある
#       https://blog.hatappi.me/entry/2018/10/08/232625