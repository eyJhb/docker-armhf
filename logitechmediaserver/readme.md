# Logitechmediaserver for armhf (raspberry pi)

```
  lms:
    container_name: lms
    image: eyjhb/logitechmediaserver-armhf
    restart: always
    volumes:
      - ${USERDIR}/docker/lms/config:/config
    ports:
      - 9000:9000
      - 9090:9090
      - 3483:3483
      - 3483:3483/udp
    environment:
      - PUID=${PUID}
      - PGID=${PGID}
      - TZ=${TZ}
```
