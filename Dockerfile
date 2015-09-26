FROM scaleway/ubuntu:trusty
MAINTAINER Sergey Marin <marin.sergey@gmail.com> (@Serguman)

RUN sh -c "$(curl -fsSL http://debian.yeasoft.net/add-btsync-repository.sh)" && \
`which sudo` apt-get update && \
`which sudo` apt-get install btsync

EXPOSE 8888
EXPOSE 260915

ENTRYPOINT ["btsync"]
CMD ["--config", "/btsync/btsync.conf", "--nodaemon"]
