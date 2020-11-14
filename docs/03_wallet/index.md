---
content_title: leopays-wallet
---

## Introduction

`leopays-wallet` is a key manager service daemon for storing private keys and signing digital messages. It provides a secure key storage medium for keys to be encrypted at rest in the associated wallet file. `leopays-wallet` also defines a secure enclave for signing transaction created by `leopays-cli` or a third part library.

## Installation

`leopays-wallet` is distributed as part of the [LeoPays software suite](https://github.com/leopays-core/leopays/blob/master/README.md). To install `leopays-wallet` just visit the [LeoPays Software Installation](../00_install/index.md) section.

## Operation

When a wallet is unlocked with the corresponding password, `leopays-cli` can request `leopays-wallet` to sign a transaction with the appropriate private keys. Also, `leopays-wallet` provides support for hardware-based wallets such as Secure Encalve and YubiHSM.

[[info | Audience]]
| `leopays-wallet` is intended to be used by LeoPays developers only.
