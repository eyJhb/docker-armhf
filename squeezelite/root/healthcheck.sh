#!/bin/sh
/bin/echo [HEALTHCHECK]

/bin/echo -e "GET / HTTP/1.1\n\n" | nc $SERVER 9000 | grep -i logitech

return $?
