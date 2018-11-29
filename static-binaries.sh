import "os@0.0.1"

mkdir -p "$IMPORT_CACHE/bin"
export PATH="$IMPORT_CACHE/bin:$PATH"

static_binaries() {
  local bin
  bin="$(print=1 import "./binaries/$(os_platform)/$(os_arch)/$1")" || return
  chmod +x "$bin"
  ln -sf "../data/$(basename "$bin")" "$IMPORT_CACHE/bin/$1"
}
