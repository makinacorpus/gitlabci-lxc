#!/usr/bin/env bash

LXCPATH=${LXCPATH:-/var/lib/lxc}
LXCTEMPLATE=${LXCTEMPLATE:-makinastates}
LXCNAME=${LXCTEMPLATE:-makinastates}
copspath=/srv/corpusops/corpusops.bootstrap
HERE=$(dirname $(dirname  $(readlink -f $0)))

if [ ! -e $copspath ]; then
    git clone https://github.com/corpusops/corpusops.bootstrap $copspath
fi

. $copspath/bin/cops_shell_common

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
