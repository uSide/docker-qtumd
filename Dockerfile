FROM debian:stable-slim

ENV QTUM_VERSION=0.18.1
ENV QTUM_CHECKSUM=78c9038183385fe211535c60f7cdb3663d0a77d702fabf468509d5771a3bea53

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/qtumproject/qtum/releases/download/mainnet-ignition-v${QTUM_VERSION}/qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${QTUM_CHECKSUM} qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf qtum-${QTUM_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp qtum-${QTUM_VERSION}/bin/qtumd /usr/local/bin \
    && rm -rf qtum-${QTUM_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/qtumd"]