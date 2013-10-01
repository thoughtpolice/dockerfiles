[Official repository][repo].

[repo]: https://index.docker.io/u/thoughtpolice/redis-server/

# Quick Start

To start a server:

```
$ docker pull thoughtpolice/redis-server
$ REDIS_SERVER=$(docker run -d thoughtpolice/redis-server)
$ REDIS_SERVER_IP=$(docker inspect $REDIS_SERVER | grep IPAddress | awk '{ print $2 }' | tr -d ',"')
```

And now you can connect to `$REDIS_SERVER_IP:6379` with clients. By
default, the master server will run with the configuration set in
`redis.conf`. On the container, this is located at
`/etc/redis/redis.conf` (in case you want to specify it for all
servers or whatnot.)

To connect with a CLI:

```
$ docker run -i -t thoughtpolice/redis-server redis-cli -h $REDIS_SERVER_IP
```

To start a slave:

```
$ docker run -d thoughtpolice/redis-server redis-server --slaveof $REDIS_SERVER_IP 6379
```
