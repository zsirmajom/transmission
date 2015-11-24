FROM debian:jessie

RUN apt-get update -q ;\
    apt-get -yq install transmission-daemon

VOLUME ["/torrent", "/etc/transmission-daemon"]

EXPOSE 9091 51413/tcp 51413/udp

CMD ["transmission-daemon", "-f", "--config-dir", "/etc/transmission-daemon", "--log-error"]
