FROM ubuntu:latest
MAINTAINER Nathan Warner "nathan@frcv.net"

RUN echo "root:password" | chpasswd && \
    apt-get install -y supervisor openssh-server software-properties-common && \
    mkdir -p /var/run/sshd && \
    mkdir -p /var/log/supervisor && \
    sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    add-apt-repository --yes ppa:chris-lea/node.js && \
    apt-get update --yes && \
    apt-get install --yes nodejs && \
    cd / && \
    wget --quiet https://github.com/eirikb/weecloud/archive/master.tar.gz -O weecloud.tar.gz && \
    tar -zxf weecloud.tar.gz && \
    cd weecloud-master && \
    /usr/bin/npm install

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22 3000
CMD ["/usr/bin/supervisord"]
