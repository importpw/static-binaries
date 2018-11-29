FROM andrewd/osxcross
ENV TREE_VERSION=1.8.0
RUN curl -sfLS http://mama.indstate.edu/users/ice/tree/src/tree-${TREE_VERSION}.tgz | tar xzv --strip-components=1
ENV AR=x86_64-apple-darwin12-ar
ENV NM=x86_64-apple-darwin12-nm
ENV CC='x86_64-apple-darwin12-clang -flto -O3 -mmacosx-version-min=10.6'
ENV CXX='x86_64-apple-darwin12-clang++ -flto -O3 -mmacosx-version-min=10.6'
ENV CFLAGS='-frandom-seed=build-ncurses-darwin -fomit-frame-pointer'
ENV RANLIB=x86_64-apple-darwin12-ranlib

COPY . .
RUN patch -p1 < 0001-Makefile.patch

RUN OSXCROSS_NO_INCLUDE_PATH_WARNINGS=1 make XOBJS+=strverscmp.o
