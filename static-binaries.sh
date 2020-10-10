__static_binaries_location="$(dirname "$__import_location")"
import "os@0.1.0"

static_binaries() {
  local path=""
  local cache="$(import_cache_dir_import)"
  mkdir -p "$cache/bin" || return
  os_path_unshift "$cache/bin" || return

  path="$(print=1 import "$__static_binaries_location/binaries/$(os_platform)/$(os_arch)/$1")" || return
  if [ ! -x "$path" ]; then
    [ -n "${IMPORT_DEBUG-}" ] && printf "static-binaries: " >&2
    chmod ${IMPORT_DEBUG:+-v} +x "$path" >&2 || return
  fi

  local bin="$cache/bin/$1"
  if [ ! -e "$bin" ]; then
    [ -n "${IMPORT_DEBUG-}" ] && printf "static-binaries: creating symlink " >&2
    ln -fs${IMPORT_DEBUG:+v} "..${path:${#cache}}" "$bin" >&2 || return
  fi
}
