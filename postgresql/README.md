[Official repository][repo].

## Usage

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

Then you can connect with your credentials and begin talking to the database.

You can also tweak `postgresql.conf` and `pg_hba.conf` to control server
configuration.

[repo]: https://index.docker.io/u/thoughtpolice/postgres/
