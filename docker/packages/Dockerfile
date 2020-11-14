FROM leopays/leopays-builder as builder

ARG leopays_repo="https://github.com/leopays-core/leopays.git"
ARG leopays_branch="master"
ARG symbol="LPC"
ARG type="Release"

RUN git clone -b $leopays_branch $leopays_repo /leopays && cd /leopays && \
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
    JOBS=${JOBS:-"$(getconf _NPROCESSORS_ONLN)"} && make -j$JOBS

RUN cd /leopays/build/packages && chmod 755 ./*.sh && \
    ./generate_package.sh deb
