![](https://github.com/WindowsXP95/NeXTSPACE-Live/blob/master/wiki-res/application_nib.tiff.gif?raw=true)
# About 



This project aims to make a Nextspace Linux distro by using the now retired nextspace-build-iso scripts by nicktelindert. This project is also currently in beta so except beta quailty for a bit. The system is currently based on CentOS 7 for compatability sake. A Cent OS 8 version is currently in the makes.


## Known issues
- No gui networking tools
- No decision made on base applications yet.

## Logging in
- You can login with the live cd/usb with username "nextspace" and an empty password.

## Requirements for Building
- A dual core processor
- Atleast 4 GB of ram
- A good network connection (for downloading the necessary tools and packages for building)
- Docker Installed Already
- Linux or macOS [(Check Here fo more info)](https://github.com/WindowsXP95/NeXTSPACE-Live/wiki/Building-and-Compatibility)

## How to Get Started
To build v1 of NextSpace OS, Run create.sh in the Docker/centos7 folder(install docker first) the image will be placed in the root of your home folder. It should be named "NEXTSPACEOS.iso"

To build v2 Beta of the of NextSpace OS (based on Cent OS 8), Run create.sh in the Docker/centos8 folder.


For Linux: check /home/username/ or /root
For macOS: chek your /Users/username/

[Learn more about Nextspace](https://www.github.com/trunkmaster/nextspace) credits to Trunkmaster and nicktelindert for the orignal scripts

## Run it in QEMU

qemu-system-x86_64 -enable-kvm -m 1G -cdrom NEXTSPACE.iso

## Run it in VBox

Make a new RedHat Linux based VM, you can call it anything you want. Give it about 1 GB of ram and at least 8 GB of HD space if you plan to install it.

You really need KVM to get decent performance
You can also run it inside of VirtualBox
