#!/bin/sh
/bin/echo [HEALTHCHECK]

/bin/echo -e "GET / HTTP/1.1\n\n" | nc -w 2 127.0.0.1 9000 | grep -i logitech

return $?
