# About

This project aims to make a Nextspace Linux distro by using the now retired nextspace-build-iso scripts by nicktelindert. This project is also currently in beta so except beta quailty for a bit. This branch is based off of CentOS 8 and may be unstable.


## Known issues
- No gui networking tools
- No decision made on base applications yet.

## Logging in
- You can login with the live cd/usb with username "nextspace" and an empty password.

## Requiremnets for Building
- A dual core processor
- Atleast 4 GB of ram
- A good network connection (for downloading the necessary tools and packages for building)
- Docker Installed Already

## How to Get Started
Run create.sh in the Docker/centos8 folder(install docker first) the image will be placed in the root of your home folder. It should be named "Nextspaceos.iso"

[GO TO THE NEXTSPACE GITHUB PAGE](https://www.github.com/trunkmaster/nextspace) credits to Trunkmaster and nicktelindert for the orignal scripts

## Run in it in QEMU

qemu-system-x86_64 -enable-kvm -m 1G -cdrom Nextspaceos.iso

You really need KVM to get decent performance
You can also run it inside of VirtualBox
