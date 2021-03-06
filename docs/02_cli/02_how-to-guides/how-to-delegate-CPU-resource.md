## Goal

Delegate resource for an account or application

## Before you begin

* Install the currently supported version of `leopays-cli`

* Ensure the reference system contracts from `leopays.contracts` repository is deployed and used to manage system resources

* Understand the following:
  * What is an account
  * What is network bandwidth
  * What is CPU bandwidth

## Steps

Delegate 0.01 LPC CPU bandwidth from `bob` to `alice`

```sh
leopays-cli system delegatebw bob alice "0.01 LPC" "0 LPC"
```

You should see something below:

```console
executed transaction: 5487afafd67bf459a20fcc2dbc5d0c2f0d1f10e33123eaaa07088046fd18e3ae  192 bytes  503 us
#         lpc <= lpc::delegatebw            {"from":"bob","receiver":"alice","stake_net_quantity":"0.0000 LPC","stake_cpu_quanti...
#   lpc.token <= lpc.token::transfer        {"from":"bob","to":"lpc.stake","quantity":"0.0010 LPC","memo":"stake bandwidth"}
#  bob <= lpc.token::transfer        {"from":"bob","to":"lpc.stake","quantity":"0.0010 LPC","memo":"stake bandwidth"}
#   lpc.stake <= lpc.token::transfer        {"from":"bob","to":"lpc.stake","quantity":"0.0010 LPC","memo":"stake bandwidth"}
```
