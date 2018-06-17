from eyjhb/debian-base-armhf:jessie

# install wget and curl
RUN apt-get update && \
	apt-get install -y wget curl

# add backport repo
RUN echo 'deb http://http.debian.net/debian jessie-backports main' | tee -a /etc/apt/sources.list

# add unifi repo
RUN echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' | tee /etc/apt/sources.list.d/100-ubnt-unifi.list && \
	wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ubnt.com/unifi/unifi-repo.gpg 

# install java and unifi
RUN apt-get update && \
	apt-get install -y -t jessie-backports openjdk-8-jdk && \
	apt-get install -y unifi 

# copy root directories
COPY root/ /

# health checks
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
      CMD /bin/sh /healthcheck.sh

# ports and volumes
EXPOSE 8080 8081 8443 8843 8880 6789
VOLUME ["/config"]

ENTRYPOINT ["/init"]
