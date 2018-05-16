FROM zzeroo/yocto
MAINTAINER Stefan  Müller <co@zzeroo.com>

USER build
WORKDIR /home/build

# RUN git clone --depth 1 git://git.yoctoproject.org/poky.git --branch sumo
RUN git clone --depth 1 git://git.yoctoproject.org/poky.git --branch rocko


ENTRYPOINT [ "bash", "-c" ]
CMD [ "cd /home/build/poky && source oe-init-build-env /home/build/shared/build && \
    bash -l" ]
# EOF
