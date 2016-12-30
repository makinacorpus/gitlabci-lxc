#!/usr/bin/env bash

LXCPATH=${LXCPATH:-/var/lib/lxc}
LXCTEMPLATE=${LXCTEMPLATE:-makinastates}
LXCNAME=${LXCTEMPLATE:-makinastates}
copspath=/srv/corpusops/corpusops.bootstrap
TOP=$(dirname $(dirname  $(readlink -f $0)))

. $TOP/bin/shell_common

post_tests_cleanup() {
    if [[ "${rc}" == "0" ]]; then
        echo "No cleanup, proceeding to tests"
        return
    fi
    echo here
}
do_trap post_tests_cleanup EXIT
exit 1
# vim:set et sts=4 ts=4 tw=80:
