#!/bin/bash

cd poky

if [[ -d /home/build/shared ]]; then
    source oe-init-build-env /home/build/shared/build
else
    source oe-init-build-env
fi

/bin/bash
