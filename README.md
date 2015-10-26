# transmission
transmission-daemon running in a docker container (Ubuntu:Trusty)

The following paths are used by transmission:

* `/torrent/completed` (completed dir)
* `/torrent/incomplete` (incomplete dir)
* `/torrent/torrents` (watch dir)

The RPC is listening without authentication required on the default port (9091), and the RPC IP whitelist is disabled.

I recommend to use it with docker-compose, here's an example docker-compose.yml:
```
transmission:
    build: zsirmajom/transmission
    volumes: 
        - /torrent:/torrent
    net: host
```

The uPNP does not work if you don't use the container with the host's network stack, 
so you should run the container with `--net="host"` parameter, or `net: host` in the docker-compose.yml
