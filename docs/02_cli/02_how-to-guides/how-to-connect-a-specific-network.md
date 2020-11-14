## Goal

Connect to a specific `leopays-node` or `leopays-wallet` host to send COMMAND

`leopays-cli` and `leopays-wallet` can connect to a specific node by using the `--url` or `--wallet-url` optional arguments, respectively, followed by the http address and port number these services are listening to.

[[info | Default address:port]]
| If no optional arguments are used (i.e. `--url` or `--wallet-url`), `leopays-cli` attempts to connect to a local `leopays-node` or `leopays-wallet` running at localhost `127.0.0.1` and default port `8888`.

## Before you begin

* Install the currently supported version of `leopays-cli`

## Steps
### Connecting to leopays-node

```sh
leopays-cli -url http://leopays-node-host:8888 COMMAND
```

### Connecting to leopays-wallet

```sh
leopays-cli --wallet-url http://leopays-wallet-host:8888 COMMAND
```
