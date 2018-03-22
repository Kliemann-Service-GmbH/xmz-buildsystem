FROM zzeroo/yocto
MAINTAINER Stefan  Müller <co@zzeroo.com>

USER build
WORKDIR /home/build

RUN git clone -b rocko git://git.yoctoproject.org/poky.git

ADD start.sh /home/build/start.sh

CMD "/home/build/start.sh"
# EOF
