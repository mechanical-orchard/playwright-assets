#!/usr/bin/env bash
set -euo pipefail
source ${REPO}/bin/lib.sh

# ------------------------------------------------------------------------------
# Usage:
#
#   serve [options]
#
# Description:
#
#   Run the (development) assets server.
#
# Options:
#
#   -p, --port=<PORT>  Port to listen on [default: 4000].
#   -h, --help         Print help text.
# ------------------------------------------------------------------------------

arg::parse "$@"

_main_() {
  echo::info "Serving on ${port}…"

  pushd ${REPO} > /dev/null
    export PLAYWRIGHT_ASSETS_PORT=${port}
    iex -S mix
  popd > /dev/null
}

_main_ "$@"
