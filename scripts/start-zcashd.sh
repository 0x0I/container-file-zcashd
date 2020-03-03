#!/bin/bash

exec $install_dir/src/zcashd -conf="${ZCASHD_CONFIG_DIR:-/etc/zcashd}/zcash.conf" $EXTRA_ARGS
