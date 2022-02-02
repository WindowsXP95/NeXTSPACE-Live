FROM centos:8
RUN rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
RUN dnf install -y https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* &&\
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
RUN yum upgrade -y
RUN dnf install -y http://mirror.centos.org/centos/7/os/x86_64/Packages/dumpet-2.1-8.el7.x86_64.rpm
RUN dnf install -y dnf-plugins-core
RUN dnf config-manager --add-repo http://mirror.1000mbps.com/centos/8.2.2004/extras/x86_64/os
RUN dnf install -y epel-release
RUN dnf install -y livecd-tools git vim