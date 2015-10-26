FROM ubuntu:trusty

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 365C5CA1 \
    && echo "deb http://ppa.launchpad.net/transmissionbt/ppa/ubuntu $(lsb_release -cs) main" \
       > /etc/apt/sources.list.d/launchpad-transmissionbt.list

RUN apt-get update -q ;\
    apt-get -yq install transmission-daemon
    
ADD etc/transmission-daemon/settings.json /etc/transmission-daemon/settings.json

VOLUME ["/torrent"]

EXPOSE 9091 51413/tcp 51413/udp

CMD ["transmission-daemon", "-f", "--config-dir", "/var/lib/transmission-daemon/info", "--log-error"]