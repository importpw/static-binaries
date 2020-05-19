FROM andrewd/osxcross
WORKDIR /usr/src
ENV JQ_VERSION=1.6
RUN curl -sfLS https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-${JQ_VERSION}.tar.gz | tar xzv --strip-components=1
RUN autoreconf -fi
ENV AR=x86_64-apple-darwin12-ar
ENV NM=x86_64-apple-darwin12-nm
ENV CC='x86_64-apple-darwin12-clang -flto -O3 -mmacosx-version-min=10.6'
ENV CXX='x86_64-apple-darwin12-clang++ -flto -O3 -mmacosx-version-min=10.6'
ENV CFLAGS='-frandom-seed=build-ncurses-darwin'
ENV RANLIB=x86_64-apple-darwin12-ranlib
RUN ./configure \
  --enable-all-static \
  --build=i686 \
  --host=x86_64-apple-darwin
RUN OSXCROSS_NO_INCLUDE_PATH_WARNINGS=1 make
RUN x86_64-apple-darwin12-strip jq
