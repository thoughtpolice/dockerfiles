[Official repository][repo].

[repo]: https://index.docker.io/u/thoughtpolice/spark/

# Quick Start

Start a master:

```
$ docker pull thoughtpolice/spark
$ SPARK_MASTER=$(docker run -d thoughtpolice/spark /opt/start-spark-master.sh)
```

Get the IP for the lxc interface:

```
$ docker inspect $SPARK_MASTER | grep IPAddress
```

Now start workers pointing to port 7077 on the container (this is needed due to
the way Spark resolves hostnames):

```
$ SPARK_WORKER=$(docker run -d thoughtpolice/spark /opt/start-spark-worker.sh spark://172.16.42.205:7077)
```

You can view the web interface too. In my case you can view it at
http://172.16.42.205:8080, and you should see one worker.

You can also use `spark-shell` to connect directly to the lxc cluster from your
host machine. You *must* have spark-0.7.2 located inside /opt/spark-0.7.2/. I
personally symlink it like:


```
$ sudo ln -sv $HOME/spark/spark-0.7.2 /opt/spark-0.7.2/
```

(This will probably change to an unsymlinked version in the future.)

Now you can run `spark-shell` from your host machine:

```
$ cd /opt/spark-0.7.2/
$ MASTER=spark://172.16.42.205:7077 ./spark-shell
```

If you go back to the web interface, you should see the 'Spark Shell'
application connected to your Spark master.

If you want to crunch data, you can use docker volumes to map directories to
all the masters and slaves, but it's easier to use HDFS.
