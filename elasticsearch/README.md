[Official repository][repo].

[repo]: https://index.docker.io/u/thoughtpolice/elasticsearch/

# Quick Start

To start a server:

```
$ docker pull thoughtpolice/elasticsearch
$ ELASTICSEARCH_MASTER=$(docker run -d thoughtpolice/elasticsearch)
$ ELASTICSEARCH_MASTER_IP=$(docker inspect $ELASTICSEARCH_MASTER | grep IPAddress | awk '{ print $2 }' | tr -d ',"')
```

Adding slaves is trivial:

```
$ docker run -d thoughtpolice/elasticsearch
$ docker run -d thoughtpolice/elasticsearch
$ ...
```

They'll automatically cluster together over the docker interface correctly.
