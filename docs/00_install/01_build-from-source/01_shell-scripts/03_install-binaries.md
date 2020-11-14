---
content_title: Install LeoPays Binaries
---

## LeoPays install script

For ease of contract development, content can be installed at the `/usr/local` folder using the `install.sh` script within the `leopays` folder. Adequate permission is required to install on system folders:

```sh
cd ~/leopays-core/leopays
sudo ./install.sh
```

## LeoPays Manual install

In lieu of the `install.sh` script, you can install the LeoPays binaries directly by invoking `make install` within the `leopays/build` folder. Again, adequate permission is required to install on system folders:

```sh
cd ~/leopays-core/leopays/build
sudo make install
```

[[info | What's Next?]]
| Configure and use [leopays-node](../../../01_node/index.md), or optionally [Test the LeoPays binaries](./04_test-binaries.md).
