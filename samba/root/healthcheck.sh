#!/bin/sh
/bin/echo [HEALTHCHECK]

/usr/bin/nc -z 127.0.0.1 139
return $?
