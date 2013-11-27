[Official repository][repo].

[repo]: https://index.docker.io/u/thoughtpolice/presto/

# Quick Start

First, you must start a discovery server:

```
$ docker pull thoughtpolice/discovery-server
$ docker pull thoughtpolice/presto
$ docker run -d -name discovery-server thoughtpolice/discovery-server -Dnode.environment=docker -Dnode.id=`uuidgen` run
$ DISCOVERY_SERVER_IP=$(docker inspect discovery-server | grep IPAddress | awk '{ print $2 }' | tr -d ',"')
```

Next, start a Presto coordinator:

```
$ docker run -d -name presto-master thoughtpolice/presto -Dnode.environment=docker -Dnode.id=`uuidgen` -Dcoordinator=true -Ddatasources=jmx -Ddiscovery.uri=http://$DISCOVERY_SERVER_IP:8411 run
$ PRESTO_MASTER_IP=$(docker inspect presto-master | grep IPAddress | awk '{ print $2 }' | tr -d ',"')
```

Then, start some workers:

```
$ docker run -d -name presto-worker1 thoughtpolice/presto -Dnode.environment=docker -Dnode.id=`uuidgen` -Dcoordinator=false -Ddatasources=jmx,example -Ddiscovery.uri=http://$DISCOVERY_SERVER_IP:8411 run
$ docker run -d -name presto-worker2 thoughtpolice/presto -Dnode.environment=docker -Dnode.id=`uuidgen` -Dcoordinator=false -Ddatasources=jmx,example -Ddiscovery.uri=http://$DISCOVERY_SERVER_IP:8411 run
```

Finally, start the Presto CLI and query the example table from the
example schema, containing numbers and other stuff:

```
$ ./presto-cli-0.54 --server $PRESTO_MASTER_IP:8080 --catalog example
presto:default> show schemas;
       Schema       
--------------------
 example            
 information_schema 
 sys                
 tpch               
(4 rows)

Query 20131127_053406_00038_j8jpq, FINISHED, 2 nodes
Splits: 2 total, 2 done (100.00%)
0:00 [4 rows, 52B] [42 rows/s, 557B/s]

presto:default> show tables from example;
  Table  
---------
 numbers 
(1 row)

Query 20131127_053413_00039_j8jpq, FINISHED, 1 node
Splits: 2 total, 2 done (100.00%)
0:00 [1 rows, 24B] [4 rows/s, 108B/s]

presto:default> describe example.numbers;
 Column |  Type   | Null | Partition Key 
--------+---------+------+---------------
 text   | varchar | true | false         
 value  | bigint  | true | false         
(2 rows)

Query 20131127_053419_00040_j8jpq, FINISHED, 2 nodes
Splits: 2 total, 2 done (100.00%)
0:00 [2 rows, 138B] [7 rows/s, 522B/s]

presto:default> select * from example.numbers;
  text  | value 
--------+-------
 ten    |    10 
 eleven |    11 
 twelve |    12 
 one    |     1 
 two    |     2 
 three  |     3 
(6 rows)

Query 20131127_053425_00041_j8jpq, FINISHED, 3 nodes
Splits: 3 total, 3 done (100.00%)
0:01 [12 rows, 110B] [13 rows/s, 127B/s]

presto:default> ^D
$
```

Note carefully that the `docker run` invocation generates a random
UUID for the discovery server. If you need something else (possibly
preconfigured or stashed somewhere,) just use that instead.

You are required to specify (and only specify): `node.environment`,
`node.id`, `discovery.uri`, `coordinator`, and `datasources`. See the
[Presto documentation](http://prestodb.io/docs/current/installation/deployment.html)
for more.

The discovery data directory is located at `/presto-data` and
mounted as a docker volume, so you can look it up or map it to a host
volume if you want.
