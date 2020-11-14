---
content_title: Install Prebuilt Binaries
---

[[info | Previous Builds]]
| If you have previously installed LeoPays from source using shell scripts, you must first run the [Uninstall Script](./01_build-from-source/01_shell-scripts/05_uninstall.md) before installing any prebuilt binaries on the same OS.

## Prebuilt Binaries

Prebuilt LeoPays software packages are available for the operating systems below. Find and follow the instructions for your OS:

### Mac OS X:

#### Mac OS X Brew Install
```sh
brew tap leopays-core/leopays
brew install leopays
```
#### Mac OS X Brew Uninstall
```sh
brew remove leopays
```

### Ubuntu Linux:

#### Ubuntu 18.04 Package Install
```sh
wget https://github.com/leopays-core/leopays/releases/download/v0.1.0/leopays_0.1.0-1-ubuntu-18.04_amd64.deb
sudo apt install ./leopays_0.1.0-1-ubuntu-18.04_amd64.deb
```
#### Ubuntu 16.04 Package Install
```sh
wget https://github.com/leopays-core/leopays/releases/download/v0.1.0/leopays_0.1.0-1-ubuntu-16.04_amd64.deb
sudo apt install ./leopays_0.1.0-1-ubuntu-16.04_amd64.deb
```
#### Ubuntu Package Uninstall
```sh
sudo apt remove leopays
```

### RPM-based (CentOS, Amazon Linux, etc.):

#### RPM Package Install
```sh
wget https://github.com/leopays-core/leopays/releases/download/v0.1.0/leopays-0.1.0-1.el7.x86_64.rpm
sudo yum install ./leopays-0.1.0-1.el7.x86_64.rpm
```
#### RPM Package Uninstall
```sh
sudo yum remove leopays
```

## Location of LeoPays binaries

After installing the prebuilt packages, the actual LeoPays binaries will be located under:
* `/usr/opt/leopays/<version-string>/bin` (Linux-based); or
* `/usr/local/Cellar/leopays/<version-string>/bin` (MacOS)

where `version-string` is the LeoPays version that was installed.

Also, soft links for each LeoPays program (`leopays-node`, `leopays-cli`, `leopays-wallet`, etc.) will be created under `usr/bin` or `usr/local/bin` to allow them to be executed from any directory.

## Previous Versions

To install previous versions of the LeoPays prebuilt binaries:

1. Browse to https://github.com/leopays-core/leopays/tags and select the actual version of the LeoPays software you need to install.

2. Scroll down past the `Release Notes` and download the package or archive that you need for your OS.

3. Follow the instructions on the first paragraph above to install the selected prebuilt binaries on the given OS.
