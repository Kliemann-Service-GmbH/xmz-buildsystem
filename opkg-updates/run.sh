#!/bin/bash

set -e

cd $(dirname $0)

SHAREDDIR=$PWD/../shared
CONTAINER=opkg-updates
IMAGE=zzeroo/opkg-updates

## Create, if not present, a shared folder which will be used as working directory.
if [ ! -d $SHAREDDIR ]; then echo "No shared dir found `($SHAREDDIR)`. Start of this conatiner make no sense." && exit 1; fi

# Try to start an existing/stopped container with the given name $CONTAINER.
# Otherwise, run a new one.
if docker inspect $CONTAINER >/dev/null 2>&1; then
    echo -e "\nINFO: Reattaching to running container '$CONTAINER'\n"
    docker start -i $CONTAINER
else
    echo -e "\nINFO: Creating a new container from image '$IMAGE'\n"
    docker run -ti \
        -p8000:8000 \
        --volume=$SHAREDDIR:/home/build/shared \
        --name=$CONTAINER \
        $IMAGE
fi

exit $?
