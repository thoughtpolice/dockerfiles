[Official repository][repo].

[repo]: https://index.docker.io/u/thoughtpolice/riemann-server/

# Quick Start

To start a riemann server with `riemann-dash` included):

```
$ docker pull thoughtpolice/riemann-server
$ RIEMANN_SERVER=$(docker run -d thoughtpolice/riemann-server)
$ RIEMANN_SERVER_IP=$(docker inspect $RIEMANN_SERVER | grep IPAddress | awk '{ print $2 }' | tr -d ',"')
```

You can now view the Riemann web interface at `$RIEMANN_SERVER:4567`,
although you'll have to manually point it to the `$RIEMANN_SERVER_IP`
address yourself.

You can submit events to Riemann using port `$RIEMANN_SERVER_IP:5555`
via TCP or UDP (the WebSocket interface is at
`$RIEMANN_SERVER_IP:5556`.)
