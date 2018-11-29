import "os@0.0.3"

if [ -z "${IMPORT_CACHE-}" ]; then
  IMPORT_CACHE="$HOME/.import-cache"
fi

mkdir -p "$IMPORT_CACHE/bin"
export PATH="$IMPORT_CACHE/bin:$PATH"

static_binaries() {
  local path
  path="$(print=1 import "./binaries/$(os_platform)/$(os_arch)/$1")"
  if [ ! -x "$path" ]; then
    chmod ${IMPORT_DEBUG+-v} +x "$path"
  fi

  local bin="$IMPORT_CACHE/bin/$1"
  if [ ! -e "$bin" ]; then
    ln -fs${IMPORT_DEBUG+v} "..${bin:${#IMPORT_CACHE}}" "$bin"
  fi
}
