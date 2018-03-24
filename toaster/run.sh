#!/bin/bash

set -x

cd $(dirname $0)

SHAREDDIR=$PWD/shared
CONTAINER=toaster
IMAGE=zzeroo/toaster
TOASTERCONTAINERPORT=8000
TOASTERHOSTPORT=8000

# Create, if not present, a shared folder which will be used as working directory.
[[ -d $SHAREDDIR ]] || mkdir -p $SHAREDDIR
mkdir -p $SHAREDDIR/build

# Try to start an existing/stopped container with the given name $CONTAINER.
# Otherwise, run a new one.
if docker inspect $CONTAINER >/dev/null 2>&1; then
    echo -e "\nINFO: Reattaching to running container $CONTAINER\n"
    docker start -i $CONTAINER
else
    echo -e "\nINFO: Creating a new container from image $IMAGE\n"
    docker run -t -i \
    	--volume=$SHAREDDIR/build:/home/build/poky/build \
    	--name=$CONTAINER \
      --expose $TOASTERCONTAINERPORT \
      -p $TOASTERHOSTPORT:$TOASTERCONTAINERPORT \
    	$IMAGE
fi

exit $?
