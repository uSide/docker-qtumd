FROM debian:stable-slim

ENV QTUM_VERSION=0.18.3
ENV QTUM_CHECKSUM=f70b21da2ff3e0e7aecfe3a9861df20c6be8d67e5be758f70e6b05c3c9afc951

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/qtumproject/qtum/releases/download/mainnet-ignition-v${QTUM_VERSION}/qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${QTUM_CHECKSUM} qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp qtum-${QTUM_VERSION}/bin/qtumd /usr/local/bin \
    && rm -rf qtum-${QTUM_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/qtumd"]