#!/bin/bash

exec zcashd -conf="${ZCASHD_CONFIG_DIR:-/etc/zcashd}/zcash.conf" $EXTRA_ARGS
