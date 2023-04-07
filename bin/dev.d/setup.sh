#!/usr/bin/env bash
set -euo pipefail
source ${REPO}/bin/lib.sh

# ------------------------------------------------------------------------------
# Usage:
#
#   setup
#
# Description:
#
#   Prepare the project for development and execution.
#
#   Steps:
#
#   - `brew bundle`  ... install package dependencies.
#   - `asdf install` ... install versioned software dependencies.
#   - `npm install`  ... install Node.js dependencies.
#   - `mix deps.get` ... install Elixir dependencies.
#
# Options:
#
#   -h, --help      Print help text.
# ------------------------------------------------------------------------------

arg::parse "$@"

_main_() {
  echo::info "Setting up…"

  pushd ${REPO} > /dev/null
    brew bundle
    asdf plugin add elixir || true > /dev/null
    asdf plugin add erlang || true > /dev/null
    asdf plugin add nodejs || true > /dev/null
    asdf install
    npm install
    mix deps.get
  popd > /dev/null
}

_main_ "$@"
