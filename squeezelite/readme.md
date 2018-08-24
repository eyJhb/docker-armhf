# Squeezelite for armhf (raspberry pi)

```
  squeeze:
    container_name: squeeze
    image: eyjhb/squeezelite-armhf
    restart: always
    devices:
      - "/dev/snd:/dev/snd"
    environment:
      - SOUNDDEVICE=default
      - SERVER=lms
      - CLIENTNAME=stue
      - CLIENTMAC=ab:cd:ef:12:34:56
      - PUID=${PUID}
      - PGID=${PGID}
      - TZ=${TZ}
```
