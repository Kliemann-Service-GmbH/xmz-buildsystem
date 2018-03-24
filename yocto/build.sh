#!/bin/sh

set -e

cd $(dirname $0)

docker build --no-cache --rm -t zzeroo/yocto .

exit $?
