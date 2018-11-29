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
ENV TREE_VERSION=1.8.0
ENV LDFLAGS="-static"
RUN curl -sfLS http://mama.indstate.edu/users/ice/tree/src/tree-${TREE_VERSION}.tgz | tar xzv --strip-components=1
RUN make
RUN strip tree
