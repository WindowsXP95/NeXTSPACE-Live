# 2020 nicktelindert
# 2022 The NextSpaceOS Project (WindowsXP95)
# NextSpaceOS kickstart file
# version=1.1.0b_r24

lang en_US.UTF-8
firewall --disabled
keyboard us
timezone US/Eastern
auth --useshadow --passalgo=sha512
selinux --disabled
rootpw --plaintext ppc
firstboot --enabled

# Repos
repo --name=centos-7 --mirrorlist=http://mirrorlist.centos.org/?release=7&repo=os&arch=x86_64
repo --name=epel-release --baseurl=https://dl.fedoraproject.org/pub/epel/7/x86_64/ --install
repo --name=elrepo --baseurl=https://elrepo.org/linux/elrepo/el7/x86_64/ --install
repo --name=elrepo-kernel --baseurl=http://elrepo.org/linux/kernel/el7/x86_64/ --install
repo --name=elrepo-release --baseurl=http://elrepo.org/linux/elrepo/el7/x86_64/ --install
repo --name=elrepo-extras --baseurl=http://elrepo.org/linux/extras/el7/x86_64/ --install
repo --name=centosplus --baseurl=http://mirror.centos.org/centos/7/centosplus/$basearch/ --install
repo --name=centosextras --baseurl=http://mirror.centos.org/centos/7/extras/$basearch/ --install

%packages
@Core
kernel-ml
kernel-ml-devel
kernel-ml-tools-libs
kernel-ml-headers
wget
git
sudo
anaconda
@anaconda-tools
@legacy-x
xorg-x11-fonts-75dpi
xterm
@x11
mesa-libGLES
tigervnc-server
xorg-x11-drv-keyboard
xorg-x11-drv-libinput
xorg-x11-drv-mouse
xorg-x11-drv-openchrome
wayland-protocols-devel
xorg-x11-xbitmaps
xorg-x11-drv-evdev
pulseaudio
alsa-plugins-pulseaudio
plymouth
grub2-efi-modules
efibootmgr
memtest86+
shim-x64
grub2
grub2-efi-x64-cdboot
grub2-efi-x64
syslinux
firefox
emacs
gimp
hfsplus-tools
network-manager-applet
-kernel
-kernel-devel
-kernel-tools-libs
-kernel-tools
-kernel-headers
-abrt-libs
-abrt-tui
-abrt-cli
-abrt
-abrt-addon-python
-abrt-addon-ccpp
-abrt-addon-kerneloops
xorg-x11-drv-ati-firmware
-zd1211-firmware
-iprutils
-fprintd-pam
-intltool
b43-openfwwf
%end

%post --nochroot 
cp /etc/resolv.conf $INSTALL_ROOT/etc/resolv.conf
cp etc/default/useradd $INSTALL_ROOT/etc/default/useradd
cp etc/init.d/modgroups $INSTALL_ROOT/etc/init.d/modgroups
cp etc/rc.d/rc.local $INSTALL_ROOT/etc/rc.d/rc.local
chmod +x $INSTALL_ROOT/etc/rc.d/rc.local
%end

%post
cat /dev/null > /etc/fstab
passwd -d root > /dev/null

/usr/bin/systemctl disable display-manager

# /etc/hosts
cat << EOF > ${fsdir}/etc/hosts
127.0.0.1	localhost localhost.localdomain nextspaceos.local
EOF

# hostname
cat << EOF > /etc/sysconfig/network
NETWORKING=yes
HOSTNAME=nextspaceos.local
NETWORKWAIT=1
EOF

# Extra packages and repos
yum -y install vim nano indent ImageMagick gawk hfsplus-tools

yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/updates/7/x86_64/r/rpmfusion-free-release-7-4.noarch.rpm
yum -y localinstall --nogpgcheck https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm
yum -y localinstall --nogpgcheck http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
yum -y localinstall --nogpgcheck http://mirror.ghettoforge.org/distributions/gf/gf-release-latest.gf.el7.noarch.rpm 
curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo

yum -y update

yum -y install xorg-x11-apps neofetch dbus-x11

# NextSpace v0.90 pkgs 
yum -y install https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/centos7/NSUser/libdispatch-5.1.5-0.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/centos7/NSUser/libobjc2-2.0-4.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/centos7/NSUser/libwraster-5.0.0-0.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/centos7/NSUser/nextspace-gnustep-1_27_0_nextspace-1.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/centos7/NSUser/nextspace-frameworks-0.90-2.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/centos7/NSUser/nextspace-core-0.95-11.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/centos7/NSUser/nextspace-applications-0.90-0.el7.x86_64.rpm

yum -y install https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/centos7/NSDeveloper/libdispatch-devel-5.1.5-0.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/centos7/NSDeveloper/libobjc2-devel-2.0-4.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/centos7/NSDeveloper/libwraster-devel-5.0.0-0.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/centos7/NSDeveloper/nextspace-core-devel-0.95-11.el7.x86_64.rp
yum -y install https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/centos7/NSDeveloper/nextspace-gnustep-devel-1_27_0_nextspace-1.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/centos7/NSDeveloper/nextspace-frameworks-devel-0.90-2.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/centos7/NSDeveloper/nextspace-applications-devel-0.90-0.el7.x86_64.rpm



# NextSpace OS Plymouth theme
wget https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/resources/bootsplash.tar
tar xvf bootsplash.tar -C /usr/share/plymouth

# App Wrappers
wget https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/resources/appwrappers.tar
tar xvf appwrappers.tar -C /

#Custom Branding and dock apps (Experimental)
wget https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/resources/NSBranding.tar
tar xvf NSBranding.tar -C /
wget https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/resources/onestepback.tar
tar xvf onestepback.tar -C /
wget https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/resources/os-release.tar
tar xvf os-release.tar -C /
wget https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/resources/nsdockapps.tar
tar xvf nsdockapps.tar -C /

chmod +x /usr/bin/pclock
chmod +x /usr/bin/wmamixer
chmod +x /usr/bin/cputnik

# Finishing touches
yum -y install https://kojipkgs.fedoraproject.org//vol/fedora_koji_archive01/packages/wmsystemtray/1.4/3.fc24/x86_64/wmsystemtray-1.4-3.fc24.x86_64.rpm
yum -y install http://repo.openfusion.net/centos7-x86_64/wm-dockapps-1.4-1.of.el7.x86_64.rpm 


/usr/sbin/plymouth-set-default-theme nextspace -R
ln -s /usr/NextSpace/Apps/Login.app/Resources/loginwindow.service /etc/systemd/system/multi-user.target.wants/display-manager.service

rm /NSBranding.tar
rm /os-release.tar
rm /appwrappers.tar
rm /bootsplash.tar
rm /nsdockapps.tar
rm /onestepback.tar
rm -rf /Applications/TimeMon.app 

yum -y remove tboot

#Post jobs
echo 'Completed Building, preparing to make ISO...'

touch /etc/skel/Library/Preferences/.WindowMaker/autostart
chmod +x /etc/skel/Library/Preferences/.WindowMaker/autostart

echo "wmsystemtray &" >> /etc/skel/Library/Preferences/.WindowMaker/autostart
echo "nm-applet &" >> /etc/skel/Library/Preferences/.WindowMaker/autostart
echo "/usr/bin/wmamixer -w &" >> /etc/skel/Library/Preferences/.WindowMaker/autostart
#echo "/usr/bin/cputnik -w &" >> /etc/skel/Library/Preferences/.WindowMaker/autostart

# User Configs
/sbin/useradd -b /Users -s /bin/zsh -G audio,wheel $(whoami)
#passwd $(whoami)

/sbin/groupadd storage
passwd -d $(whoami) > /dev/null
chmod +x /etc/rc.d/rc.local
%end
