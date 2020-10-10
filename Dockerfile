FROM debian:stable-slim

ENV QTUM_VERSION=0.19.1
ENV QTUM_CHECKSUM=044a8e535ff8a220dbcd1fe7fadae2429c123c97bd1fb5e7c50abc0e6640c8d4

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/qtumproject/qtum/releases/download/mainnet-ignition-v${QTUM_VERSION}/qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${QTUM_CHECKSUM} qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp qtum-${QTUM_VERSION}/bin/qtumd /usr/local/bin \
    && rm -rf qtum-${QTUM_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/qtumd"]