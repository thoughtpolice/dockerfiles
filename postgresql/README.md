[Official repository][repo].

[repo]: https://index.docker.io/u/thoughtpolice/postgres/

# Quick Start

Create a file called `postgres-setup.sh.conf` next to the `Dockerfile`, containing the following information:

```
PGSQL_USER=docker
PGSQL_PASS=docker
```

Or whatever username/password you want to use. This will be the
username/password for the administrator role in the newly created Postgres
instance. Afterwords, just run:

```
$ docker build -t <name>/postgres .
```

Now you can start a server:

```
$ PGSQL_SERVER=$(docker run -d <name>/postgres)
$ PGSQL_SERVER_IP=$(docker inspect $PGSQL_SERVER | grep IPAddress | awk '{ print $2 }' | tr -d ',"')
```

You can connect to it with `psql` by running (using `docker` as the username):

```
$ docker run -t -i <name>/postgres psql -h $PGSQL_SERVER_IP -U docker -W
```

You can tweak the configuration files under `conf` before running
`docker build` to set specific server options. In particular,
`listen_addresses='*'` and access is allowed on all local ports to all
databases.
