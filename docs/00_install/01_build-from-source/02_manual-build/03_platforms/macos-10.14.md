---
content_title: MacOS 10.14
---

This section contains shell commands to manually download, build, install, test, and uninstall LeoPays and dependencies on MacOS 10.14.

[[info | Building LeoPays is for Advanced Developers]]
| If you are new to LeoPays, it is recommended that you install the [LeoPays Prebuilt Binaries](../../../00_install-prebuilt-binaries.md) instead of building from source.

Select a task below, then copy/paste the shell commands to a Unix terminal to execute:

* [Download LeoPays Repository](#download-leopays-repository)
* [Install LeoPays Dependencies](#install-leopays-dependencies)
* [Build LeoPays](#build-leopays)
* [Install LeoPays](#install-leopays)
* [Test LeoPays](#test-leopays)
* [Uninstall LeoPays](#uninstall-leopays)

[[info | Building LeoPays on another OS?]]
| Visit the [Build LeoPays from Source](../../index.md) section.

## Download LeoPays Repository
These commands set the LeoPays directories, install git, and clone the LeoPays Repository.
```sh
# set LeoPays directories
export LEOPAYS_LOCATION=~/leopays-core/leopays
export LEOPAYS_INSTALL_LOCATION=$LEOPAYS_LOCATION/../install
mkdir -p $LEOPAYS_INSTALL_LOCATION
# install git
brew update && brew install git
# clone LeoPays Repository
git clone https://github.com/leopays-core/leopays.git $LEOPAYS_LOCATION
cd $LEOPAYS_LOCATION && git submodule update --init --recursive
```

## Install Dependencies
These commands install the LeoPays software dependencies. Make sure to [Download the LeoPays Repository](#download-leopays-repository) first and set the LeoPays directories.
```sh
# install dependencies
brew install cmake python libtool libusb graphviz automake wget gmp pkgconfig doxygen openssl@1.1 jq boost || :
export PATH=$LEOPAYS_INSTALL_LOCATION/bin:$PATH
# install mongodb
mkdir -p $LEOPAYS_INSTALL_LOCATION/bin
cd $LEOPAYS_INSTALL_LOCATION && curl -OL https://fastdl.mongodb.org/osx/mongodb-osx-ssl-x86_64-3.6.3.tgz
    tar -xzf mongodb-osx-ssl-x86_64-3.6.3.tgz && rm -f mongodb-osx-ssl-x86_64-3.6.3.tgz && \
    mv $LEOPAYS_INSTALL_LOCATION/mongodb-osx-x86_64-3.6.3/bin/* $LEOPAYS_INSTALL_LOCATION/bin/ && \
    rm -rf $LEOPAYS_INSTALL_LOCATION/mongodb-osx-x86_64-3.6.3 && rm -rf $LEOPAYS_INSTALL_LOCATION/mongodb-osx-ssl-x86_64-3.6.3.tgz
# install mongo-c-driver from source
cd $LEOPAYS_INSTALL_LOCATION && curl -LO https://github.com/mongodb/mongo-c-driver/releases/download/1.13.0/mongo-c-driver-1.13.0.tar.gz && \
    tar -xzf mongo-c-driver-1.13.0.tar.gz && cd mongo-c-driver-1.13.0 && \
    mkdir -p cmake-build && cd cmake-build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$LEOPAYS_INSTALL_LOCATION -DENABLE_BSON=ON -DENABLE_SSL=DARWIN -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF -DENABLE_STATIC=ON -DENABLE_ICU=OFF -DENABLE_SASL=OFF -DENABLE_SNAPPY=OFF .. && \
    make -j $(getconf _NPROCESSORS_ONLN) && \
    make install && \
    rm -rf $LEOPAYS_INSTALL_LOCATION/mongo-c-driver-1.13.0.tar.gz $LEOPAYS_INSTALL_LOCATION/mongo-c-driver-1.13.0
# install mongo-cxx-driver from source
cd $LEOPAYS_INSTALL_LOCATION && curl -L https://github.com/mongodb/mongo-cxx-driver/archive/r3.4.0.tar.gz -o mongo-cxx-driver-r3.4.0.tar.gz && \
    tar -xzf mongo-cxx-driver-r3.4.0.tar.gz && cd mongo-cxx-driver-r3.4.0/build && \
    cmake -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$LEOPAYS_INSTALL_LOCATION .. && \
    make -j $(getconf _NPROCESSORS_ONLN) VERBOSE=1 && \
    make install && \
    rm -rf $LEOPAYS_INSTALL_LOCATION/mongo-cxx-driver-r3.4.0.tar.gz $LEOPAYS_INSTALL_LOCATION/mongo-cxx-driver-r3.4.0
```

## Build LeoPays
These commands build the LeoPays software on the specified OS. Make sure to [Install LeoPays Dependencies](#install-leopays-dependencies) first.

[[caution | `LEOPAYS_BUILD_LOCATION` environment variable]]
| Do NOT change this variable. It is set for convenience only. It should always be set to the `build` folder within the cloned repository.

```sh
export LEOPAYS_BUILD_LOCATION=$LEOPAYS_LOCATION/build
mkdir -p $LEOPAYS_BUILD_LOCATION
cd $LEOPAYS_BUILD_LOCATION && cmake -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX=$LEOPAYS_INSTALL_LOCATION -DBUILD_MONGO_DB_PLUGIN=true $LEOPAYS_LOCATION
cd $LEOPAYS_BUILD_LOCATION && make -j$(getconf _NPROCESSORS_ONLN)
```

## Install LeoPays
This command installs the LeoPays software on the specified OS. Make sure to [Build LeoPays](#build-leopays) first.
```sh
cd $LEOPAYS_BUILD_LOCATION && make install
```

## Test LeoPays
These commands validate the LeoPays software installation on the specified OS. This task is optional but recommended. Make sure to [Install LeoPays](#install-leopays) first.
```sh
$LEOPAYS_INSTALL_LOCATION/bin/mongod --fork --logpath $(pwd)/mongod.log --dbpath $(pwd)/mongodata
cd $LEOPAYS_BUILD_LOCATION && make test
```

## Uninstall LeoPays
These commands uninstall the LeoPays software from the specified OS.
```sh
xargs rm < $LEOPAYS_BUILD_LOCATION/install_manifest.txt
rm -rf $LEOPAYS_BUILD_LOCATION
```
