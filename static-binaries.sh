import "os@0.0.1"

if [ -z "${IMPORT_CACHE-}" ]; then
  IMPORT_CACHE="$HOME/.import-cache"
fi

mkdir -p "$IMPORT_CACHE/bin"
export PATH="$IMPORT_CACHE/bin:$PATH"

static_binaries() {
  local bin
  bin="$(print=1 import "./binaries/$(os_platform)/$(os_arch)/$1")" || return
  echo "$1 => $bin"
  chmod +x "$bin"
  ln -sfv "../data/$(basename "$bin")" "$IMPORT_CACHE/bin/$1"
}
