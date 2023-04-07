#!/usr/bin/env bash
set -euo pipefail
source ${REPO}/bin/lib.sh

# ------------------------------------------------------------------------------
# Usage:
#
#   docker build [options]
#   docker run   [options]
#
# Description:
#
#   Utility wrappers to Docker commands.
#
# Options:
#
#   -p, --port=<PORT>  Port to listen on [default: 4000].
#   -t, --tag=<VALUE>  Docker image tag [default: playwright-asets:latest].
#   -h, --help         Print help text.
# ------------------------------------------------------------------------------

arg::parse "$@"

_main_() {
  # NOTE:
  # The `arg::parse` above ensures that the command is supported.
  # This `cmd` mapping makes for a nice `case` statement.
  cmd="$1"

  pushd ${REPO} > /dev/null
    case "${cmd}" in
      build )
        docker::build "$@"
        ;;
      run   )
        docker::run "$@"
        ;;
      *     )
        echo::fail "Unrecognized command: '${cmd}'\n\n$(cmd::usage "$@")"
        ;;
    esac
  popd > /dev/null
}

docker::build() {
  npm run build
  docker build . --tag ${tag}
}

docker::run() {
  DOCKER_TAG=${tag}
  WEBSERVER_PORT=${port}

  # ensure the "playwright" network exists. this is useful when running a
  # Playwright (WS) server in another container, for example.
  (docker network inspect playwright || docker network create playwright) &> /dev/null

  docker run -it --rm \
    --network playwright \
    --network-alias playwright-assets \
    -e WEBSERVER_PORT \
    -p ${WEBSERVER_PORT}:${WEBSERVER_PORT} \
    -d \
    ${DOCKER_TAG}
}

_main_ "$@"
