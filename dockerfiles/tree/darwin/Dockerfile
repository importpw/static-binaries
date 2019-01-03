FROM andrewd/osxcross
ENV TREE_VERSION=1.8.0
RUN curl -sfLS http://mama.indstate.edu/users/ice/tree/src/tree-${TREE_VERSION}.tgz | tar xzv --strip-components=1
COPY *.patch .
RUN patch -p1 < 0001-Makefile.patch
RUN CC='x86_64-apple-darwin12-clang -flto -O3 -mmacosx-version-min=10.6' OSXCROSS_NO_INCLUDE_PATH_WARNINGS=1 make XOBJS+=strverscmp.o
RUN x86_64-apple-darwin12-strip tree
