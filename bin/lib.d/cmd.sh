#!/usr/bin/env bash

_main_() {
  if [ $# -ge 1 ] ; then
    flag=$1
    shift

    case "${flag}" in
      "--proxy" ) _do_proxy_ "$@"
                  ;;
      "--usage" ) _do_usage_ "$@"
                  ;;
    esac
  fi
}

_do_proxy_() {
  lib="$(realpath $0).d"
  cmd="${lib}/${1:-}.sh"

  if [ -f "${cmd}" ] ; then
    ${cmd} "${@:2}"
  else
    arg::error
  fi
}

_do_usage_() {
  arg::usage "$@"
}

_main_ "$@"
