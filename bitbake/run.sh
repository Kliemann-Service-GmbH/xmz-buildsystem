#!/bin/bash

# This script accepts one ore more `bitbake` commands as parameter.
# If the script was called without additional parameters, a interactive
# `bitbake` session, within the shared dir, is startet.
#
# Are there additional parameters then these are send to `poky` session.

set -e

cd $(dirname $0)

SHAREDDIR=$PWD/../shared
CONTAINER=bitbake
IMAGE=zzeroo/bitbake

# Create, if not present, a shared folder which will be used as working directory.
[[ -d $SHAREDDIR ]] || $(mkdir -p $SHAREDDIR && sudo chmod ug=rwX $SHAREDDIR && sudo chown 30000:300000 $SHAREDDIR)

# This container runs allways 'one shot' with the `--rm` parameter.
# If there are one ore more optional parameters given, pipe them into the
# `docker run` command as optional CMD parameters.``
if [ -z "$1" ]; then # no optional parameters given
    docker run -ti \
      --rm \
      --volume=$SHAREDDIR:/home/build/shared \
      --name=$CONTAINER \
      $IMAGE
else # one or more optional parameters
  docker run -ti \
    --rm \
    --volume=$SHAREDDIR:/home/build/shared \
    --name=$CONTAINER \
    $IMAGE "cd /home/build/poky && source oe-init-build-env /home/build/shared/build && $@"
fi

exit $?
