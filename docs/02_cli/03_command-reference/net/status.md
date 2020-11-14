## Description
status of existing connection

**Command**

```sh
leopays-cli net status
```
**Output**

```console
Usage: leopays-cli net status host

Positionals:
  host TEXT                   The hostname:port to query status of connection
```

Given, a valid, existing `hostname:port` parameter the above command returns a json response looking similar to the one below:

```
{
  "peer": "hostname:port",
  "connecting": false/true,
  "syncing": false/true,
  "last_handshake": {
    ...
  }
}
```
