#!/bin/bash
docker build -t nextspace-dev .
docker create  -v /dev:/dev --privileged=true -ti  --name nextspace-dev nextspace-dev:latest
docker start nextspace-dev
docker exec -w / -it nextspace-dev git clone https://github.com/WindowsXP95/NeXTSPACE-OS.git
docker exec -w /NeXTSPACE-OS -it nextspace-dev sh build.sh
docker cp nextspace-dev:/NeXTSPACE-OS/NEXTSPACEOS.iso ~/nextspaceos_stable-$(date +"%Y%m%d").iso
docker stop nextspace-dev
docker container rm nextspace-dev
