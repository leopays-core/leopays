## Goal

Vote for a block producer

## Before you begin

* Install the currently supported version of `leopays-cli`

* Ensure the reference system contracts from `leopays.contracts` repository is deployed and used to manage system resources

* Understand the following:
  * What is a block producer
  * How does voting works

* Unlock your wallet

## Steps

Assume you are going to vote for blockproducer1 and blockproducer2 from an account called `leopaystests`, execute the following:

```sh
leopays-cli system voteproducer prods leopaystests blockproducer1 blockproducer2
```

This should produce similar output as below:

```console
executed transaction: 2d8b58f7387aef52a1746d7a22d304bbbe0304481d7751fc4a50b619df62676d  128 bytes  374 us
#         lpc <= lpc::voteproducer          {"voter":"leopaystests","proxy":"","producers":["blockproducer1","blockproducer2"]}
```
