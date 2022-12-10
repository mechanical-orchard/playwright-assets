#!/usr/bin/env bash
source ${REPO}/bin/lib.d/echo.sh

arg::error() {
  source ${REPO}/bin/lib.d/arg.sh --error "$@"
}

arg::parse() {
  source ${REPO}/bin/lib.d/arg.sh --parse "$@"
}

arg::usage() {
  source ${REPO}/bin/lib.d/arg.sh --usage "$@"
}

cmd::proxy() {
  source ${REPO}/bin/lib.d/cmd.sh --proxy "$@"
}

cmd::usage() {
  source ${REPO}/bin/lib.d/cmd.sh --usage "$@"
}
