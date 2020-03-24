<p><img src="https://avatars1.githubusercontent.com/u/12563465?s=200&v=4" alt="OCI logo" title="oci" align="left" height="70" /></p>
<p><img src="https://previews.123rf.com/images/viktorijareut/viktorijareut1710/viktorijareut171000267/90109811-zcash-crypto-currency-block-chain-flat-logo.jpg" alt="zcash logo" title="zcash" align="right" height="80" /></p>

Container File :lock_with_ink_pen: :link: Zcashd
=========
![GitHub release (latest by date)](https://img.shields.io/github/v/release/0x0I/container-file-zcashd?color=yellow)
[![Build Status](https://travis-ci.org/0x0I/container-file-zcashd.svg?branch=master)](https://travis-ci.org/0x0I/container-file-zcashd)
[![Docker Pulls](https://img.shields.io/docker/pulls/0labs/0x01.zcashd?style=flat)](https://hub.docker.com/repository/docker/0labs/0x01.zcashd)
[![License: MIT](https://img.shields.io/badge/License-MIT-blueviolet.svg)](https://opensource.org/licenses/MIT)

**Table of Contents**
  - [Supported Platforms](#supported-platforms)
  - [Requirements](#requirements)
  - [Environment Variables](#environment-variables)
      - [Config](#config)
      - [Launch](#launch)
  - [Dependencies](#dependencies)
  - [Example Run](#example-run)
  - [License](#license)
  - [Author Information](#author-information)

Container file that installs, configures and launches Zcashd: a client for the Zcash zero-knowledge privacy blockchain/protocol.

##### Supported Platforms:
```
* Redhat(CentOS/Fedora)
* Debian
```

Requirements
------------

None

Environment Variables
--------------
Variables are available and organized according to the following software & machine provisioning stages:
* _config_
* _launch_

#### Config

**Zcashd** supports specification of various options controlling aspects of the Zcashd client's behavior and operational profile. Each configuration can be expressed within a simple configuration file, `zcashd.conf` by default, composed of **key=vaue** pairs representing configuration properties available.

_The following details the facilities provided by this role to manage the  location and content of the aforementioned configuration file:_

`$ZCASHD_CONFIG_DIR=</path/to/configuration/dir>` (**default**: `/etc/zcashd`)
- path where the `zcashd` configuration should be stored

```bash
ZCASHD_CONFIG_DIR=/mnt/etc/zcashd
```

As indicated, available configuration options are organized according to the systems/subsystems they are used to manage. For a reference to the list of available configuration options, see [here](https://zcash.readthedocs.io/en/latest/rtd_pages/zcash_conf_guide.html).

Each of these configurations can be expressed using environment variables prefixed with `CONFIG_`, organized according to the following:
* **network-related** - settings related to client network broadcasting and listening properties
* **json-rpc** - JSON-RPC server interfacing properties
* **transaction-fee** - client properties managing cost of verifying network transactions
* **miscellaneous** - additional properties managing client mining and privacy protection operations

`$CONFIG_<config-property> = <property-value (string)>` **default**: *None*

* Any configuration setting/value key-pair supported by `zcashd` should be expressible within each `CONFIG_*` environment variable and properly rendered within the associated config. **Note:** `<config-property>` along with the `,property-value` specifications should be written as expected to be rendered within the associated config (**e.g.** `CONFIG_testnet=1`).

Furthermore, configuration is not constrained by hardcoded author defined defaults or limited by pre-baked templating. If the config section, setting and value are recognized by the `zcashd` tool, :thumbsup: to define within an environnment variable according to the following syntax.

  A list of configurable settings can be found [here](https://zcash.readthedocs.io/en/latest/rtd_pages/zcash_conf_guide.html).

  `<config-property>` -- represents a specific configuration property to set:

  ```bash
  # Property: server (tells zcashd to accept JSON-RPC commands)
  CONFIG_server=<property-value>
  ```

  `<property-value>` -- represents property value to configure:
  ```bash
  # Property: server
  # Value: 1 (enabled)
  CONFIG_server=1
  ```

#### Launch

Running the `zcashd` client and RPC server is accomplished utilizing official **Zcashd** binaries, obtained from zcash's github [site](https://github.com/zcash/zcash/releases). Launched subject to the configuration and execution potential provided by the underlying application, the `zcashd` client and RPC server can be set to adhere to system administrative policies right for your environment and organization.

_The following variables can be customized to manage Zcashd's execution profile/policy:_

`$EXTRA_ARGS: <zcashd-cli-options>` (**default**: *NONE*)
- list of `zcashd` commandline arguments to pass to the binary at runtime for customizing launch.

  Supporting full expression of `zcashd`'s [cli](https://zcash.readthedocs.io/en/latest/rtd_pages/user_guide.html#using-zcash), this variable enables the launch to be customized according to the user's exact specification.

##### Examples

  Debug a particular category/subsystem of zcashd's operation:
  ```bash
  EXTRA_ARGS=-debug=net # network operations
  ```

  Include timestamps and IPs in debug output:
  ```bash
  EXTRA_ARGS="-logips -logtimestamps"
  ```

  Connect to the test network and enable acceptance of public REST requests:
  ```
  EXTRA_ARGS="-testnet -rest"
  ```
  
  Activate mining and set the number of cores to allocate to mining operations:
  ```
  EXTRA_ARGS="-gen -genproclimit=4"
  ```

Dependencies
------------

None

Example Run
----------------
Basic setup with defaults:
```
podman run 0labs/0x01.zcashd:v2.1.1-1_ubuntu-18.04
```

Connect to testnet and customize the location of the data directory:
```
podman run --env CONFIG_testnet=1 --env EXTRA_ARGS="-datadir=/mnt/data/zcashd" --volume zcashd_data:/mnt/data/zcashd 0labs/0x01.zcashd:v2.1.1-1_ubuntu-19.04
```

Connect client to mainnet and enable both REST and RPC servers:
```
podman run --env CONFIG_testnet=0 \
           --env CONFIG_listen=1 \
           --env CONFIG_server=1 \
           --env CONFIG_rpcuser=ops \
           --env CONFIG_rpcgroups=ops \
           --env EXTRA_ARGS="-rest -bind=0.0.0.0" \
           0labs/0x01.zcashd:v2.1.1-1_ubuntu-19.04
```

Send transactions as zero-fee transactions when possible and rescan the blockchain for missing wallet transactions on startup:
```
podman run --env CONFIG_sendfreetransactions=1 --env EXTRA_ARGS="-rescan" 0labs/0x01.zcashd:v2.1.1-1_ubuntu-19.04
```

Enable CPU mining with more efficient hash algorithm solver(exposing ALL cores for use):
```
podman run --env CONFIG_gen=1 \
           --env CONFIG_genproclimit=-1 \
           --env CONFIG_equihashsolver=tromp
           0labs/0x01.zcashd:v2.1.1-1_ubuntu-19.04
```

License
-------

MIT

Author Information
------------------

This Containerfile was created in 2020 by O1.IO.
