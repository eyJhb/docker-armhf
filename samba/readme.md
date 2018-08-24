# Samba for armhf (raspberry pi)

```
  smb:
    container_name: smb
    image: eyjhb/samba-armhf
    restart: always
    volumes:
      - /media/:/media/
      - ${USERDIR}/docker/smb/config:/config
    ports:
      - 137:137/udp
      - 138:138/udp
      - 139:139
      - 445:445
      - 445:445/udp
    environment:
      - PUID=${PUID}
      - PGID=${PGID}
      - TZ=${TZ}
```

This might help you with auth!

```
min protocol = SMB2
map to guest = bad user
```
