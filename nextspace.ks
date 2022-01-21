lang en_US.UTF-8
firewall --disabled
keyboard us
timezone US/Eastern
auth --useshadow --passalgo=sha512
selinux --disabled
rootpw --plaintext root
repo --name=centos-7 --mirrorlist=http://mirrorlist.centos.org/?release=7&repo=os&arch=x86_64

%packages
@core
@x11
kernel-devel
wget
git
anaconda
@anaconda-tools
pulseaudio
alsa-plugins-pulseaudio
kernel
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
127.0.0.1	localhost localhost.localdomain nextspace.local
EOF

# hostname
cat << EOF > /etc/sysconfig/network
NETWORKING=yes
HOSTNAME=nextspace.local
NETWORKWAIT=1
EOF

# NextSpace packages
yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm

yum -y install vim nano indent ImageMagick inkscape gawk 

yum -y --nogpgcheck localinstall https://raw.githubusercontent.com/rpmsphere/x86_64/master/g/gnustep-gui-libs-0.25.1-4.1.x86_64.rpm
yum -y --nogpgcheck localinstall https://download1.rpmfusion.org/nonfree/el/updates/7/x86_64/b/broadcom-wl-6.30.223.271-13.el7.noarch.rpm
yum -y --nogpgcheck localinstall https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum -y localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm

yum -y update

yum -y install mpv screenfetch

yum -y install https://github.com/WindowsXP95/NeXTSPACE-Live/raw/master/NS/NSUser/libwraster-5.0.0-0.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-Live/raw/master/NS/NSUser/libdispatch-5.1.5-0.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-Live/raw/master/NS/NSUser/libobjc2-2.0-4.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-Live/raw/master/NS/NSUser/nextspace-core-0.95-11.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-Live/raw/master/NS/NSUser/nextspace-gnustep-1_27_0_nextspace-1.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-Live/raw/master/NS/NSUser/nextspace-frameworks-0.90-2.el7.x86_64.rpm
yum -y install https://github.com/WindowsXP95/NeXTSPACE-Live/raw/master/NS/NSUser/nextspace-applications-0.90-0.el7.x86_64.rpm

wget https://github.com/WindowsXP95/NeXTSPACE-Live/raw/master/appwrappers.tar.gz
tar xvf appwrappers.tar.gz -C /

yum -y install https://kojipkgs.fedoraproject.org//vol/fedora_koji_archive01/packages/wmsystemtray/1.4/3.fc24/x86_64/wmsystemtray-1.4-3.fc24.x86_64.rpm

/usr/sbin/plymouth-set-default-theme nextspace -R
ln -s /usr/NextSpace/Apps/Login.app/Resources/loginwindow.service /etc/systemd/system/multi-user.target.wants/display-manager.service
yum -y remove tboot

touch /etc/skel/Library/Preferences/.WindowMaker/autostart
chmod +x /etc/skel/Library/Preferences/.WindowMaker/autostart
echo "wmsystemtray &" >> /etc/skel/Library/Preferences/.WindowMaker/autostart
echo "nm-applet &" >> /etc/skel/Library/Preferences/.WindowMaker/autostart

/sbin/useradd -b /Users -s /bin/zsh -G audio nextspace
/sbin/groupadd storage
passwd -d nextspace > /dev/null
%end
