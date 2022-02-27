![](https://github.com/WindowsXP95/NeXTSPACE-OS/blob/master/wiki-res/icons/user-home.png)
# About 


This project aims to make a Nextspace Linux distro by using the now retired nextspace-build-iso scripts by nicktelindert. This project is also currently in beta so except beta quailty for a bit. The system is currently based on CentOS 7 and uses The NextSpace DE v0.85.


## Known issues
- No GUI networking tools
- No decision made on base applications yet.
- Weird mount error on startup when first booting (Live mode only)

## Logging in
- You can login with the live cd/usb with username "nextspaceos" and an empty password.

## Requirements for Building
- At least dual core processor
- A minimum of 4 GB of ram
- A good network connection (for downloading the necessary tools and packages for building)
- Docker already installed
- Any Terminal App
- Linux or macOS [(Check Here fo more info)](https://github.com/WindowsXP95/NeXTSPACE-Live/wiki/Building-and-Compatibility)

## How to Get Started
To build a stable version of NextSpace OS, Run create.sh in the Docker/nextspaceos folder (install Docker first) the image will be placed in the root of your home folder. It should be named "NEXTSPACEOS.iso"

Update: NextSpaceOS will be based on CentOS 7 ONLY. This is due to it still being supported untill 2024. Plus its more easier to config and work on. Ive tried to work with the Cent OS 8 scripts but to no success. You could possibly make a CentOS 8 version if you know what your doing.


For Linux: check /home/username/ or /root (can only be accessed via SuperUser on most distros)
For macOS: chek your /Users/username/

[Learn more about NextSpace](https://www.github.com/trunkmaster/nextspace) credits to Trunkmaster and nicktelindert for the orignal scripts

## Run it in QEMU

qemu-system-x86_64 -m 2G -cdrom NEXTSPACEOS.iso

## Run it in VBox

Make a new RedHat Linux based VM, you can call it anything you want. Give it about 1 GB of ram and at least 12 GB of HD space if you plan to install it.

You really need KVM to get decent performance
You can also run it inside of VirtualBox (recommended if your not used to QEMU)

## More Info
[Grab some releases here](https://github.com/WindowsXP95/NeXTSPACE-OS/wiki/Releases)

More info can be found inside of the wiki (which is under construction)
