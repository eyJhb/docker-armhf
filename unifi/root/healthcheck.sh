#!/bin/sh
/bin/echo [HEALTHCHECK]

/bin/echo -e "GET / HTTP/1.1\n\n" | nc 127.0.0.1 8080 | grep -i unifi

return $?
