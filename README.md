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

...*description of configuration related vars*...

#### Launch

...*description of launch related vars*...

Dependencies
------------

None

Example Run
----------------
default example:
```
podman run 0labs/0x01.zcashd:centos-7
```

License
-------

MIT

Author Information
------------------

This Containerfile was created in 2020 by O1.IO.
