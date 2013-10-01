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

You can view the web interface with your workers listed at
`http://$SPARK_MASTER_IP:8080`

You can also launch the spark-shell or python-spark shell (using
ipython) with:

```
$ docker run -i -t -e MASTER=spark://$SPARK_MASTER_IP:7077 thoughtpolice/spark sh shell.sh
$ docker run -i -t -e MASTER=spark://$SPARK_MASTER_IP:7077 thoughtpolice/spark sh pyshell.sh
```

You can launch Scala jobs standalone against the spark server:

```
$ ./scala-upload.sh scala-test SimpleApp local
$ ./scala-upload.sh scala-test SimpleApp spark://$SPARK_MASTER_IP:7077
```

The first argument is a directory (relative to `./scala-upload.sh`)
containing an SBT project. The second argument is the class name, and
any remaining arguments are passed to the job. See the demo in
`scala-test` for some examples.

**NB**: You _must_ launch `./scala-upload.sh` from the directory it is
located in. You're probably best off just putting all your jobs into
a single package.

You can also easily launch Python scripts for playing around (locally
or against a master.) For example:

```
$ ./python-upload.sh python-test/SimpleApp.py local
$ ./python-upload.sh python-test/SimpleApp.py spark://$SPARK_MASTER_IP:7077
```

**NB**: You _must_ launch `./python-upload.sh` from the the directory
it is located in.

If you want to crunch data, you can use docker volumes to map
directories to all the masters and slaves, but it's easier to use
HDFS.
