# 2022 The NextSpace OS Project
#!/bin/zsh
docker build -t nextspace-dev .
docker create  -v /dev:/dev --privileged=true -ti  --name nextspace-dev nextspace-dev:latest
docker start nextspace-dev
docker exec -w / -it nextspace-dev git clone https://github.com/WindowsXP95/NeXTSPACE-Live.git
docker exec -w /NeXTSPACE-Live -it nextspace-dev sh build_v2.sh
docker cp nextspace-dev:/NeXTSPACE-Live/NEXTSPACEOS_v2.iso ~/NEXTSPACEOS_v2.iso
docker stop nextspace-dev

#temp
#docker container rm nextspace-dev
