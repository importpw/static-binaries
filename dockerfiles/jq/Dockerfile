FROM alpine:3.8
WORKDIR /usr/src
RUN apk add --no-cache \
  autoconf \
  automake \
  build-base \
  bash \
  curl \
  git \
  libtool \
  linux-headers

ENV JQ_VERSION=1.6
RUN curl -sfLS https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-${JQ_VERSION}.tar.gz | tar xzv --strip-components=1
RUN autoreconf -fi
RUN ./configure \
  --enable-all-static
RUN make
