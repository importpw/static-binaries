FROM tootallnate/osxcross
RUN curl -sfLS https://github.com/wahern/hexdump/archive/rel-20181215.tar.gz | tar xzv --strip-components=1
RUN make -f GNUmakefile
RUN x86_64-apple-darwin12-strip hexdump
