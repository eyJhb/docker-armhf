#from eyjhb/alpine-base:armhf
from baseimage-debian

# install lms
RUN apt-get install -y wget apt-utils libio-socket-ssl-perl && \
	os=$(dpkg --print-architecture) && \
	if [ "$os" = "armhf" ]; then os=arm; fi && \
	url="http://www.mysqueezebox.com/update/?version=7.9.1&revision=1&geturl=1&os=deb$os" && \
	latest_lms=$(wget -q -O - "$url") && \
	mkdir -p /sources && \
	cd /sources && \
	wget $latest_lms && \
	lms_deb=${latest_lms##*/} && \
	dpkg -i $lms_deb || true && \
	apt-get -f -y install

# copy root directories
COPY root/ /

# health checks
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
      CMD /bin/sh /healthcheck.sh

# ports and volumes
EXPOSE 9000 9090 9090 3483/udp 3483
VOLUME ["/config"]

ENTRYPOINT ["/init"]
