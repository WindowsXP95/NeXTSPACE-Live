#!/bin/bash
docker build -t nextspace-dev .
docker create  -v /dev:/dev --privileged=true -ti  --name nextspace-dev nextspace-dev:latest
docker start nextspace-dev
docker exec -w / -it nextspace-dev git clone https://github.com/WindowsXP95/NeXTSPACE-Live.git
docker exec -w /nextspace-build-iso -it nextspace-dev sh build.sh
docker cp nextspace-dev:/NeXTSPACE-Live/Nextspaceos-beta.iso ~/Nextspaceos-beta.iso
docker stop nextspace-dev
docker container rm nextspace-dev
