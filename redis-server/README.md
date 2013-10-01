[Official repository][repo].

[repo]: https://index.docker.io/u/thoughtpolice/redis-server/

# Quick Start

To start a server:

```
$ docker pull thoughtpolice/redis-server
$ REDIS_SERVER=$(docker run -d thoughtpolice/redis-server)
$ REDIS_SERVER_IP=$(docker inspect $REDIS_SERVER | grep IPAddress | awk '{ print $2 }' | tr -d ',"')
```

And now you can connect to `$REDIS_SERVER_IP:6379` with clients.

