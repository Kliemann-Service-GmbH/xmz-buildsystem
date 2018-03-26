#!/bin/bash

set -e

cd $(dirname $0)

SHAREDDIR=$PWD/../shared
CONTAINER=bitbake
IMAGE=zzeroo/bitbake

# Create, if not present, a shared folder which will be used as working directory.
[[ -d $SHAREDDIR ]] || mkdir -p $SHAREDDIR && chmod 777 $SHAREDDIR && chown 30000:300000 $SHAREDDIR

# Try to start an existing/stopped container with the given name $CONTAINER.
# Otherwise, run a new one.
if docker inspect $CONTAINER >/dev/null 2>&1; then
    echo -e "\nINFO: Reattaching to running container '$CONTAINER'\n"
    docker start -i $CONTAINER
else
    echo -e "\nINFO: Creating a new container from image '$IMAGE'\n"
    docker run -ti \
      --volume=$SHAREDDIR:/home/build/shared \
      --name=$CONTAINER \
      $IMAGE
fi

exit $?
