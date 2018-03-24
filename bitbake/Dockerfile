FROM zzeroo/yocto
MAINTAINER Stefan  Müller <co@zzeroo.com>

USER build
WORKDIR /home/build

#RUN git clone --depth 1 -b rocko git://git.yoctoproject.org/poky.git
RUN git clone --depth 1 git://git.yoctoproject.org/poky.git


ENTRYPOINT [ "bash", "-c", "cd /home/build/poky && source oe-init-build-env /home/build/shared/build && \
    bash -l" ]
# EOF
