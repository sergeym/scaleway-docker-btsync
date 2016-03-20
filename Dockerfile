FROM scaleway/ubuntu:trusty
MAINTAINER Sergey Marin <marin.sergey@gmail.com> (@Serguman)

# Install packages.
RUN apt-get update 
RUN apt-get -y install \
   wget

ADD http://download-cdn.getsyncapp.com/stable/linux-arm/BitTorrent-Sync_arm.tar.gz /opt/btsync/

RUN \
  mkdir -p /opt/btsync/bin && \
  mkdir -p /opt/btsync/etc && \
  mkdir -p /opt/btsync/data && \
  cd /opt/btsync && \
  tar -xzvf BitTorrent-Sync_*.tar.gz && \
  chmod +x btsync && \
  mv btsync bin/ && \
  ln -s /lib/arm-linux-gnueabihf/ld-linux.so.3 /lib/ld-linux.so.3 && \
  ./bin/btsync --dump-sample-config > etc/btsync.conf 

WORKDIR /opt/btsync


EXPOSE 8888
EXPOSE 26915

# Define the default command.
CMD [ "/opt/btsync/bin/btsync", "--config", "/opt/btsync/etc/btsync.conf", "--nodaemon"]
