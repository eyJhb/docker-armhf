from eyjhb/debian-base-armhf:jessie as builder

# install build essentials
RUN echo "**** Installing stuff for building *****" && \ 
	apt-get update && \
	apt-get install -y git gcc make build-essential && \
	apt-get install -y libasound2 libasound2-dev libflac-dev libmad0-dev libfaad-dev libmpg123-dev libvorbis-dev && \
	echo "**** Getting source and making *****" && \ 
	cd / && \
	git clone https://github.com/ralph-irving/squeezelite.git && \
	cd squeezelite && \
	make && \
	echo "**** Cleanup  *****" && \ 
	apt-get purge -y git gcc make build-essential && \
	apt-get autoremove -y && \
	apt-get clean -y 



from eyjhb/debian-base-armhf:jessie
COPY --from=builder /squeezelite/squeezelite /usr/bin/

# install alsa mixer
RUN apt-get install -y alsa-utils libmad0 libmpg123-0 && \
	apt-get autoremove -y && \
	apt-get clean -y

# copy root directories
COPY root/ /

# health checks
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
      CMD /bin/sh /healthcheck.sh

ENTRYPOINT ["/init"]
