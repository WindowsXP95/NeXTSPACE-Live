#!/bin/bash
# 2022 The NextSpace OS Project
# Start script v1.1a

docker build -t nextspace-testing . -f Dockerfile
docker create  -v /dev:/dev --privileged=true -ti  --name nextspace-testing nextspace-testing:latest
docker start nextspace-testing
docker exec -w / -it nextspace-testing git clone https://github.com/WindowsXP95/NeXTSPACE-OS.git
docker exec -w /NeXTSPACE-OS -it nextspace-testing sh /NeXTSPACE-OS/build/build.sh
docker cp nextspace-testing:/NeXTSPACE-OS/nextspaceos_rel.iso ~/nextspaceos_rel-$(date +"%Y%m%d").iso
docker cp nextspace-testing:/NeXTSPACE-OS/nextspaceos_rel_beta.iso ~/nextspaceos_rel_beta-$(date +"%Y%m%d").iso
#docker stop nextspace-testing
#docker container rm nextspace-testing
