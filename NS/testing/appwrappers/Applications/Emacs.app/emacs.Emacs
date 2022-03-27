#!/bin/sh

COMAND="env DBUS_SESSION_BUS_ADDRESS=unix:path/tmp emacs"

if [ "$2" != "" ];
then
    exec ${COMAND} "$2"
else
    exec ${COMAND}
fi
