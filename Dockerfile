FROM debian:stable-slim

ENV QTUM_VERSION=0.20.1
ENV QTUM_CHECKSUM=e9a77eb3e2b76625fdc8058c12bc0790309b24b9c1ac39f4895e4f8756cf0010

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/qtumproject/qtum/releases/download/mainnet-ignition-v${QTUM_VERSION}/qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${QTUM_CHECKSUM} qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp qtum-${QTUM_VERSION}/bin/qtumd /usr/local/bin \
    && rm -rf qtum-${QTUM_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/qtumd"]