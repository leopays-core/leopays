FROM leopays/leopays-builder as builder

ARG repo="https://github.com/leopays-core/leopays.git"
ARG branch="master"
ARG symbol="LPC"
ARG type="Release"

RUN apt-get update -y && apt-get install -y libcurl4-openssl-dev libusb-1.0-0-dev

RUN git clone -b $branch $repo /leopays && cd /leopays && \
    git submodule update --init --recursive && \
    echo "$branch:$(git rev-parse HEAD)" > /etc/leopays-version && \
    mkdir -p build && cd build && \
    cmake -DCMAKE_CXX_COMPILER="clang++-7" -DCMAKE_C_COMPILER="clang-7" \
        -DLLVM_DIR="/usr/lib/llvm-7/lib/cmake/llvm" \
        -DENABLE_MULTIVERSION_PROTOCOL_TEST=true \
        -DCMAKE_INSTALL_PREFIX="/opt/leopays" \
        -DBUILD_MONGO_DB_PLUGIN=true \
        -DCMAKE_BUILD_TYPE="$type" \
        -DCORE_SYMBOL_NAME="$symbol" .. && \
    JOBS=${JOBS:-"$(getconf _NPROCESSORS_ONLN)"} && make -j$JOBS && make install


FROM ubuntu:18.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    openssl ca-certificates curl wget libssl1.1 libicu60 libusb-1.0-0 libcurl3-gnutls && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/lib/* /usr/local/lib/
COPY --from=builder /opt/leopays/bin/* /opt/leopays/bin/
COPY --from=builder /leopays/docker/config.ini /
COPY --from=builder /etc/leopays-version /etc/
COPY --from=builder /leopays/docker/leopays-node.sh /opt/leopays/bin/leopays-node.sh
ENV LEOPAYS_ROOT=/opt/leopays
RUN chmod +x /opt/leopays/bin/leopays-node.sh
ENV LD_LIBRARY_PATH /usr/local/lib
ENV PATH /opt/leopays/bin:$PATH
