#!/bin/bash
docker build -t nextspaceos-dev .
docker create  -v /dev:/dev --privileged=true -ti  --name nextspaceos-dev nextspaceos-dev:latest
docker start nextspaceos-dev
docker exec -w / -it nextspaceos-dev git clone https://github.com/WindowsXP95/NeXTSPACE-Live.git
docker exec -w /NeXTSPACE-Live -it nextspace-dev sh build_v2.sh
docker echo " Finished Building iso. Now copying..."
docker cp nextspaceos-dev:/NeXTSPACE-Live/NEXTSPACEOS_v2.iso ~/NEXTSPACEOS_v2.iso
docker stop nextspaceos-dev
#docker container rm nextspaceos-dev
