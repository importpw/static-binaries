#!/usr/bin/env import
set -euo pipefail
import "assert@2.1.3"
import "tootallnate/static-binaries@0.0.5"

static_binaries jq
assert_equal "$IMPORT_CACHE/bin/jq" "$(which jq)"

static_binaries socat
assert_equal "$IMPORT_CACHE/bin/socat" "$(which socat)"
