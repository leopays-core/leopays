
# LeoPays - The Most Powerful Infrastructure for Decentralized Applications
**VERSION: v0.1.0**

Welcome to the LeoPays source code repository! This software enables businesses to rapidly build and deploy high-performance and high-security blockchain-based applications.

Some of the groundbreaking features of LeoPays include:

1. Free Rate Limited Transactions
1. Low Latency Block confirmation (0.5 seconds)
1. Low-overhead Byzantine Fault Tolerant Finality
1. Designed for optional high-overhead, low-latency BFT finality
1. Smart contract platform powered by WebAssembly
1. Designed for Sparse Header Light Client Validation
1. Scheduled Recurring Transactions
1. Time Delay Security
1. Hierarchical Role Based Permissions
1. Support for Biometric Hardware Secured Keys (e.g. Apple Secure Enclave)
1. Designed for Parallel Execution of Context Free Validation Logic
1. Designed for Inter Blockchain Communication

## Official Testnet
[testnet.leopays.com](https://testnet.leopays.com/)

## Supported Operating Systems
LeoPays currently supports the following operating systems:  

1. [ ] Amazon Linux 2
2. [ ] CentOS 7
3. [ ] Ubuntu 16.04
4. [x] Ubuntu 18.04
5. [ ] MacOS 10.14 (Mojave)
6. [x] MacOS 10.15 (Catalina)

---

## Software Installation
If you are new to LeoPays, it is recommended that you install the [LeoPays Prebuilt Binaries](#prebuilt-binaries), then proceed to the [Getting Started](docs/) walkthrough. If you are an advanced developer, a block producer, or no binaries are available for your platform, you may need to [Build LeoPays from source](docs/00_install/01_build-from-source).

---

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

## Uninstall Script
To uninstall the LeoPays built/installed binaries and dependencies, run:
```sh
./uninstall.sh
```

## Documentation
1. [leopays-node](./docs/01_node/)
1. [leopays-cli](./docs/02_cli/)
1. [leopays-wallet](./docs/03_wallet/)

## Resources
1. [EOSIO Developer Portal](https://developers.eos.io)

## License
1. See [LICENSE](./LICENSE) for copyright and license terms.
2. See [EOSIO LICENSE](./eosio.license) for copyright and license terms.
