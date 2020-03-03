#!/bin/bash

# Print all commands executed if DEBUG mode enabled
[ -n "${DEBUG:-""}" ] && set -x

config_dir="${ZCASHD_CONFIG_DIR:-/etc/zcashd}"
config_path="${config_dir}/zcash.conf"

mkdir -p $config_dir

# Add provisioning header
echo "# Managed by 0xO1.IO" >> $config_path

if env | grep CONFIG_; then
  for VAR in `env | sort -h`
  do
    if [[ "$VAR" =~ ^CONFIG_ ]]; then
      property_key=`echo "$VAR" | sed -r "s/CONFIG_(.*)=.*/\1/g" | tr _ .`
      property_value=`echo "CONFIG_${property_key}"`
      echo "$property_key = ${!property_value}" >> $config_path
    fi
  done
fi
