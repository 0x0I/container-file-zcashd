#!/bin/bash

set -euo pipefail

# Print all commands executed if DEBUG mode enabled
[ -n "${DEBUG:-""}" ] && set -x

# [Test-Setup]
cat <<OS | xargs -I % docker build --file builds/artifacts/%/Containerfile --tag testing-zcashd:% .
centos-7
centos-8
fedora-29
fedora-30
fedora-31
ubuntu-18.04
ubuntu-19.04
debian-8
debian-9
OS

# [Test-Run+Validate]
export GOSS_FILES_PATH=test
cat <<OS | xargs -I % dgoss run --env-file test/config-test.env testing-zcashd:%
centos-7
centos-8
fedora-29
fedora-30
fedora-31
ubuntu-18.04
ubuntu-19.04
debian-8
debian-9
OS
unset GOSS_FILES_PATH
