FROM ubuntu:18.04

# Arguments that may be overridden by the user
ARG release=latest

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    openssl ca-certificates curl wget libssl1.1 libicu60 libusb-1.0-0 libcurl3-gnutls && \
    rm -rf /var/lib/apt/lists/*

# Install from deb package
ADD install_deb.sh /
RUN /install_deb.sh $release && rm -f install_deb.sh

COPY ./config.ini /
COPY ./leopays-node.sh /opt/leopays/bin/leopays-node.sh
RUN chmod +x /opt/leopays/bin/leopays-node.sh
ENV PATH /opt/leopays/bin:$PATH
