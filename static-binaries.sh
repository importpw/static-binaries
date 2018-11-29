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
    [ -n "${IMPORT_DEBUG-}" ] && printf "static-binaries: " >&2
    chmod ${IMPORT_DEBUG+-v} +x "$path"
  fi

  local bin="$IMPORT_CACHE/bin/$1"
  if [ ! -e "$bin" ]; then
    [ -n "${IMPORT_DEBUG-}" ] && printf "static-binaries: creating symlink " >&2
    ln -fs${IMPORT_DEBUG+v} "..${path:${#IMPORT_CACHE}}" "$bin"
  fi
}
