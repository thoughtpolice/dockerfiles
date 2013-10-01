[Official repository][repo].

[repo]: https://index.docker.io/u/thoughtpolice/spark/

# Quick Start

Start a master:

```
$ docker pull thoughtpolice/spark
$ SPARK_MASTER=$(docker run -d thoughtpolice/spark sh master.sh)
$ SPARK_MASTER_IP=$(docker inspect $SPARK_MASTER | grep IPAddress | awk '{ print $2 }' | tr -d ',"')
```

Now start workers pointing to port 7077 on the container:

```
$ docker run -d thoughtpolice/spark sh worker.sh spark://$SPARK_MASTER_IP:7077
```

You can view the web interface too. In my case you can view it at
`http://$SPARK_MASTER_IP:8080`, and you should see one worker.

You can also launch the spark-shell or python-spark shell with:

```
$ docker run -i -t -e MASTER=spark://$SPARK_MASTER_IP:7077 thoughtpolice/spark sh shell.sh
$ docker run -i -t -e MASTER=spark://$SPARK_MASTER_IP:7077 thoughtpolice/spark sh pyshell.sh
```

If you want to crunch data, you can use docker volumes to map directories to
all the masters and slaves, but it's easier to use HDFS.
