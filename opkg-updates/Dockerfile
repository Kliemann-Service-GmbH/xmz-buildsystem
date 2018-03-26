FROM zzeroo/yocto
MAINTAINER Stefan  Müller <co@zzeroo.com>

USER build
WORKDIR /home/build

EXPOSE 8000
ENTRYPOINT [ "bash", "-c" ]
CMD [ "cd /home/build/shared/build/tmp/deploy/ipk && \
    python3 -m http.server" ]
# EOF
