#!/usr/bin/env bash
set -euo pipefail
source ${REPO}/bin/lib.sh

# ------------------------------------------------------------------------------
# Usage:
#
#   fetch <branch>
#
# Description:
#
#   Update the bundled Playwright assets.
#
# Options:
#
#   -h, --help      Print help text.
# ------------------------------------------------------------------------------

arg::parse "$@"

_main_() {
  echo::info "Fetching Playwright assets…"

  pushd ${REPO} > /dev/null
    # Add the microsoft/playwright repo as a remote.
    if ! git remote | grep "playwright" > /dev/null ; then
      git remote add --fetch --no-tags playwright https://github.com/microsoft/playwright.git
    else
      git fetch playwright
    fi

    # Overwrite the local assets.
    git rm -r priv/assets
    git read-tree --prefix=priv/assets -u playwright/${branch}:tests/assets

    # Clean up. Remove the following paths:
    #   - selenium-grid. It's WAY too big.
    rm -rf priv/assets/selenium-grid
  popd > /dev/null
}

_main_ "$@"
