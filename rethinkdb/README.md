[Official repository][repo].

[repo]: https://index.docker.io/u/thoughtpolice/rethinkdb/

# Quick Start

To start a server:

```
$ docker pull thoughtpolice/rethinkdb
$ RETHINKDB_MASTER=$(docker run -d thoughtpolice/rethinkdb)
$ RETHINKDB_MASTER_IP=$(docker inspect $RETHINKDB_MASTER | grep IPAddress | awk '{ print $2 }' | tr -d ',"')
```

You can now view the web interface at `$RETHINKDB_MASTER_IP:8080`.

You can connect more nodes as slaves:

```
$ docker run -d thoughtpolice/rethinkdb rethinkdb --join $RETHINKDB_MASTER_IP:29015
```

All of the RethinkDB nodes have their data located in
`/data/rethinkdb_data` by default, so you can map this directory
however you want to the host.
