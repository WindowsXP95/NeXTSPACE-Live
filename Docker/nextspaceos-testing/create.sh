#!/bin/bash
docker build -t nextspace-testing .
docker create  -v /dev:/dev --privileged=true -ti  --name nextspace-testing nextspace-testing:latest
docker start nextspace-testing
docker exec -w / -it nextspace-testing git clone https://github.com/WindowsXP95/NeXTSPACE-OS.git
docker exec -w /NeXTSPACE-OS -it nextspace-testing sh /NeXTSPACE-OS/testing/build_testing.sh
docker cp nextspace-testing:/NeXTSPACE-OS/NEXTSPACEOS_testbuild.iso ~/nextspaceos_testbuild-$(date +"%Y_%m_%d_%I:%M_%p").iso
docker stop nextspace-testing
docker container rm nextspace-testing
