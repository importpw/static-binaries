__static_binaries_location="$(dirname "$__import_location")"
import "os@0.1.0"

static_binaries() {
  local path
  local cache="${IMPORT_CACHE-${HOME}/.import-cache}"
  mkdir -p "$cache/bin"
  os_path_unshift "$cache/bin"

  path="$(print=1 import "$__static_binaries_location/binaries/$(os_platform)/$(os_arch)/$1")"
  if [ ! -x "$path" ]; then
    [ -n "${IMPORT_DEBUG-}" ] && printf "static-binaries: " >&2
    chmod ${IMPORT_DEBUG:+-v} +x "$path" >&2
  fi

  local bin="$cache/bin/$1"
  if [ ! -e "$bin" ]; then
    [ -n "${IMPORT_DEBUG-}" ] && printf "static-binaries: creating symlink " >&2
    ln -fs${IMPORT_DEBUG:+v} "..${path:${#cache}}" "$bin" >&2
  fi
}
