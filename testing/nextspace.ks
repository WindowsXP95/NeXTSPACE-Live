# 2020 nicktelindert
# 2022 The NextSpaceOS Project (WindowsXP95)
# NextSpaceOS kickstart file
# version=1.1.0b_r5

lang en_US.UTF-8
firewall --disabled
keyboard us
timezone US/Eastern
auth --useshadow --passalgo=sha512
firstboot --disabled
eula --agreed
selinux --disabled
rootpw --plaintext nextspaceos
repo --name=centos-7 --mirrorlist=http://mirrorlist.centos.org/?release=7&repo=os&arch=x86_64
repo --name=epel-release --baseurl=http://anorien.csc.warwick.ac.uk/mirrors/epel/7/x86_64/
repo --name=elrepo-kernel --baseurl=http://elrepo.org/linux/kernel/el7/x86_64/
repo --name=elrepo-release --baseurl=http://elrepo.org/linux/elrepo/el7/x86_64/
repo --name=elrepo-extras --baseurl=http://elrepo.org/linux/extras/el7/x86_64/
repo --name=multimedia --baseurl=http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
repo --name=others --baseurl=http://mirror.ghettoforge.org/distributions/gf/gf-release-latest.gf.el7.noarch.rpm


%packages
@core
@x11
kernel-ml
kernel-ml-devel
kernel-ml-tools
kernel-ml-tools-libs
kernel-ml-headers
wget
git
sudo
cups-libs
cups-pk-helper
anaconda
@anaconda-tools
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
network-manager-applet
-kernel
-kernel-devel
-kernel-tools-libs
-kernel-tools
-kernel-headers
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

# Remi Repo
yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm

# Extra packages and repos
yum -y install vim nano indent ImageMagick gawk pasystray screenfetch

yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum -y localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/updates/7/x86_64/r/rpmfusion-free-release-7-4.noarch.rpm
yum -y localinstall --nogpgcheck https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm

yum -y update

yum -y install mpv 



# NextSpace Packages (0.85)
yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/llvm-libs-7.0.1-3.el7.x86_64.rpm

yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/clang-libs-7.0.1-4.el7.x86_64.rpm
yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/clang-7.0.1-4.el7.x86_64.rpm
yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/libdispatch-1.3.1121-3.el7.x86_64.rpm
yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/libdispatch-devel-1.3.1121-3.el7.x86_64.rpm

yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/libobjc2-2.0-3.el7.x86_64.rpm
yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/libobjc2-devel-2.0-3.el7.x86_64.rpm

yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/nextspace-core-0.95-8.el7.x86_64.rpm
yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/nextspace-core-devel-0.95-8.el7.x86_64.rpm

yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/nextspace-gnustep-1.26.0_0.25.0-2.el7.x86_64.rpm
yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/nextspace-gnustep-devel-1.26.0_0.25.0-2.el7.x86_64.rpm

yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/nextspace-frameworks-0.85-2.el7.x86_64.rpm
yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/nextspace-frameworks-devel-0.85-2.el7.x86_64.rpm

yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/nextspace-applications-0.85-3.el7.x86_64.rpm
yum -y install https://github.com/trunkmaster/nextspace/releases/download/0.85/nextspace-applications-devel-0.85-3.el7.x86_64.rpm

# NextSpace OS Plymouth theme
wget https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/resources/NSThemes.tar
tar xvf NSThemes.tar -C /usr/share/plymouth

# App Wrappers
wget https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/resources/appwrappers.tar
tar xvf appwrappers.tar -C /

#Custom Branding (Experimental)
wget https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/resources/NSBranding.tar
tar xvf NSBranding.tar -C /
wget https://github.com/WindowsXP95/NeXTSPACE-OS/raw/master/NS/resources/os-release.tar
tar xvf os-release.tar -C /

# Finishing touches
yum -y install https://kojipkgs.fedoraproject.org//vol/fedora_koji_archive01/packages/wmsystemtray/1.4/3.fc24/x86_64/wmsystemtray-1.4-3.fc24.x86_64.rpm

/usr/sbin/plymouth-set-default-theme  -R
ln -s /usr/NextSpace/Apps/Login.app/Resources/loginwindow.service /etc/systemd/system/multi-user.target.wants/display-manager.service


yum -y remove tboot

#Post jobs
echo 'Completed Building, preparing to make ISO...'

touch /etc/skel/Library/Preferences/.WindowMaker/autostart
chmod +x /etc/skel/Library/Preferences/.WindowMaker/autostart
echo "wmsystemtray &" >> /etc/skel/Library/Preferences/.WindowMaker/autostart
echo "nm-applet &" >> /etc/skel/Library/Preferences/.WindowMaker/autostart
echo "pasystray &" >> /etc/skel/Library/Preferences/.WindowMaker/autostart


# User Configs
/sbin/useradd -b /Users -s /bin/zsh -G audio,wheel NSUser
#passwd $USERNAME

/sbin/groupadd storage
passwd -d NSUser > /dev/null
chmod +x /etc/rc.d/rc.local
%end
