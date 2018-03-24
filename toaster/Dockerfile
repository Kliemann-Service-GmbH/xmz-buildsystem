FROM zzeroo/yocto:latest
MAINTAINER Stefan  Müller <co@zzeroo.com>

USER root
RUN apt-get update && apt-get -y upgrade

USER build
# Clone poky (toaster is part of)
RUN bash -c "[[ -d /home/build/poky ]] || (cd /home/build && git clone --depth=1 git://git.yoctoproject.org/poky poky)"

# Install Toaster packages
RUN cd /home/build/poky && pip3 install -r /home/build/poky/bitbake/toaster-requirements.txt

RUN bash -c "cd /home/build/poky && source oe-init-build-env && source toaster start webport=0.0.0.0:8000"

EXPOSE 8000

SHELL ["/bin/bash", "-c"]
CMD cd /home/build/poky && \
  source oe-init-build-env && \
  source toaster start webport=0.0.0.0:8000 && \
  tail -f /home/build/poky/build/toaster_web.log && \
  /bin/bash

# EOF
