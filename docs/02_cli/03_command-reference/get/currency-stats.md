## Description
Retrieve the stats of for a given currency

## Positional Parameters
`contract` _TEXT_  - The contract that operates the currency

`symbol` _TEXT_ - The symbol for the currency if the contract operates multiple currencies
## Options
There are no options for this subcommand
## Example
Get stats of the LPC token from the lpc.token contract. 

```sh
leopays-cli get currency stats lpc.token LPC
```
```json
{
  "LPC": {
    "supply": "1000000000.0000 LPC",
    "max_supply": "10000000000.0000 LPC",
    "issuer": "lpc"
  }
}
```
