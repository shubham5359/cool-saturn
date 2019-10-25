#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5db2722d7c8a420013de9666/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5db2722d7c8a420013de9666
curl -s -X POST https://api.stackbit.com/project/5db2722d7c8a420013de9666/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5db2722d7c8a420013de9666/webhook/build/publish > /dev/null
