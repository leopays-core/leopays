---
content_title: leopays-node
---

## Introduction

`leopays-node` is the core service daemon that runs on every LeoPays node. It can be configured to process smart contracts, validate transactions, produce blocks containing valid transactions, and confirm blocks to record them on the blockchain.

## Installation

`leopays-node` is distributed as part of the [LeoPays software suite](https://github.com/leopays-core/leopays/blob/master/README.md). To install `leopays-node`, visit the [LeoPays Software Installation](../00_install/index.md) section.

## Explore

Navigate the sections below to configure and use `leopays-node`.

* [Usage](02_usage/index.md) - Configuring and using `leopays-node`, node setups/environments.
* [Plugins](03_plugins/index.md) - Using plugins, plugin options, mandatory vs. optional.
* [Replays](04_replays/index.md) - Replaying the chain from a snapshot or a blocks.log file.
* [RPC APIs](05_rpc_apis/index.md) - Remote Procedure Call API reference for plugin HTTP endpoints.
* [Logging](06_logging/index.md) - Logging config/usage, loggers, appenders, logging levels.
* [Upgrade Guides](07_upgrade-guides/index.md) - LeoPays version/consensus upgrade guides.
* [Troubleshooting](08_troubleshooting/index.md) - Common `leopays-node` troubleshooting questions.

[[info | Access Node]]
| A local or remote LeoPays access node running `leopays-node` is required for a client application or smart contract to interact with the blockchain.
