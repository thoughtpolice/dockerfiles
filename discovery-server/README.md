[Official repository][repo].

[repo]: https://index.docker.io/u/thoughtpolice/discovery-server/

# Quick Start

To start a server:

```
$ docker pull thoughtpolice/discovery-server
$ docker run -d thoughtpolice/discovery-server -Dnode.environment=docker -Dnode.id=`uuidgen` run
```

Note carefully that the `docker run` invocation generates a random
UUID for the discovery server. If you need something else (possibly
preconfigured or stashed somewhere,) just use that instead.

You are required to specify (and only specify) `node.environment` and
`node.id`

The discovery data directory is located at `/discovery-data` and
mounted as a docker volume, so you can look it up or map it to a host
volume if you want.
