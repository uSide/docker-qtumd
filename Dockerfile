FROM debian:stable-slim

ENV QTUM_VERSION=0.18.2
ENV QTUM_CHECKSUM=503f6c9acd4ca800baa2092e904a0bf84e6e59cf96c29204296d0c644e8bf2c8

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/qtumproject/qtum/releases/download/mainnet-ignition-v${QTUM_VERSION}/qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${QTUM_CHECKSUM} qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp qtum-${QTUM_VERSION}/bin/qtumd /usr/local/bin \
    && rm -rf qtum-${QTUM_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/qtumd"]