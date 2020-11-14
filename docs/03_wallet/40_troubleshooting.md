---
content_title: leopays-wallet Troubleshooting
---

## How to solve the error "Failed to lock access to wallet directory; is another `leopays-wallet` running"?

Since `leopays-cli` may auto-launch an instance of `leopays-wallet`, it is possible to end up with multiple instances of `leopays-wallet` running. That can cause unexpected behavior or the error message above.

To fix this issue, you can terminate all running `leopays-wallet` instances and restart `leopays-wallet`. The following command will find and terminate all instances of `leopays-wallet` running on the system:

```sh
pkill leopays-wallet
```
