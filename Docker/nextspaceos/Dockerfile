FROM centos:8
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* &&\
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
RUN yum upgrade -y
RUN dnf install -y https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/d/dumpet-2.1-21.el8.x86_64.rpm
RUN dnf install -y dnf-plugins-core
RUN dnf install -y epel-release
RUN dnf install -y livecd-tools git vim