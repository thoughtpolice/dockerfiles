[Official repository][repo].

[repo]: https://index.docker.io/u/thoughtpolice/hdfs/

# Quick Start

Start a HDFS single-node cluster. (NB: this doesn't have MapReduce support
since I use it with Spark):

```
$ docker pull thoughtpolice/hdfs
$ HDFS_MASTER=$(docker run -d thoughtpolice/hdfs /opt/start-dfs.sh)
$ HDFS_MASTER_IP=$(docker inspect $HDFS_MASTER | grep IPAddress | awk '{ print $2 }' | tr -d ',"')
```

You can view the node HTTP interface at `$HDFS_MASTER_IP:50070`.

Now you can upload data to the LXC container directly on port 8020.

```
$ cd $HOME/spark/hadoop-1.1.2
$ cat /tmp/hdfs-test.txt
the
quick brown
fox
jumped over
the
dog
$ ./bin/hadoop fs -put /tmp/hdfs-test.txt hdfs://172.16.42.207:9000/hdfs-test.txt
$ ./bin/hadoop fs -cat hdfs://172.16.42.207:9000/hdfs-test.txt
the
quick brown
fox
jumped over
the
dog
$
```

If you're using `spark-shell`, you can now connect to the cluster and get data from HDFS:

```
$ MASTER=spark://172.16.42.205:7077 ./spark-shell
scala> val textFile = sc.textFile("hdfs://172.16.42.207:9000/hdfs-test.txt").cache()
...
textFile: spark.RDD[String] = MappedRDD[1] at textFile at <console>:12

scala> textFile.count()
...
13/07/28 23:27:46 INFO spark.SparkContext: Job finished: count at <console>:15, took 0.895920868 s
res0: Long = 6

scala> textFile.count()
...
13/07/28 23:28:58 INFO spark.SparkContext: Job finished: count at <console>:15, took 0.04510405 s
res1: Long = 6
```
