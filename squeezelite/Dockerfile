from eyjhb/debian-base-armhf:jessie as builder

# install build essentials
RUN apt-get update && \
	apt-get install -y git gcc make build-essential

# requirements
RUN apt-get install -y libasound2 libasound2-dev libflac-dev libmad0-dev libfaad-dev libmpg123-dev libvorbis-dev

# clone and make
RUN git clone https://github.com/ralph-irving/squeezelite.git && \
	cd squeezelite && \
	make


from eyjhb/debian-base-armhf:jessie
COPY --from=builder /squeezelite/squeezelite /usr/bin/

# install alsa mixer
RUN apt-get install -y alsa-utils libmad0 libmpg123-0

# copy root directories
COPY root/ /

# health checks
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
      CMD /bin/sh /healthcheck.sh

ENTRYPOINT ["/init"]
