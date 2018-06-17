#from eyjhb/alpine-base:armhf
from baseimage

# install packages
RUN \
  apk add --no-cache \
    samba-server

# copy root directories
COPY root/ /

# health checks
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
      CMD /bin/sh /healthcheck.sh

# ports and volumes
EXPOSE 137/udp 138/udp 139 445 445/udp
VOLUME ["/config"]

ENTRYPOINT ["/init"]
