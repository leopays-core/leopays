## Goal

Transfer token created by lpc.token contract

## Before you begin

* Install the currently supported version of `leopays-cli`

* You are going to transfer a token created by lpc.token contract and lpc.token contract has been deployed on the network which you are connected to

* Understand the following:
  * What is a transaction
  * Token transfers are irrevertable 

## Steps

Assume you would like to transfer `0.0001 LPC` token to an account called `bob` from an account called `alice`, execute the following:

```sh
leopays-cli transfer alice bob "0.0001 LPC" "Hodl!" -p alice@active
```
