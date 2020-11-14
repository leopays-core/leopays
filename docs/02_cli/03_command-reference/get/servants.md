## Description
Retrieve accounts which are servants of a given account 

## Info

**Command**

```sh
leopays-cli get servants
```
**Output**

```console
Usage: leopays-cli get servants account

Positionals:
  account TEXT                The name of the controlling account
```

## Command

```sh
leopays-cli get servants inita
```

## Output

```json
{
  "controlled_accounts": [
    "tester"
  ]
}
```
