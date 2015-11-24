# transmission
transmission-daemon running in a container (debian:jessie)

The following paths are used by transmission:

* `/torrent/completed` (completed dir)
* `/torrent/incomplete` (incomplete dir)
* `/torrent/torrents` (watch dir)
* `/etc/transmission-daemon` (transmission data dir)

> Note: You should move the .data/settings.json to the mounted data dir (/etc/transmission-daemon), or mount .data to /etc/transmission-daemon as you can see in the docker-compose.yml example below

The RPC is listening without authentication required on the default port (9091), and the RPC IP whitelist is disabled.

I recommend to use it with docker-compose, here's an example docker-compose.yml:
```
transmission:
    image: zsirmajom/transmission
    volumes: 
        - "/torrent:/torrent"
        - "./.data:/etc/transmission-daemon"
    net: host
```

> The uPNP does not work if you don't use the container with the host's network stack, 
> so you should run the container with `--net="host"` parameter, or `net: host` in the docker-compose.yml
