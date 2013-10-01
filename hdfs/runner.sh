#!/bin/sh

IP=`ip -4 addr show eth0 | tail -1 | awk '{print $2}' | cut -d/ -f1`

# clear out hosts on run
rm /etc/hosts
echo 127.0.0.1 localhost >>  /etc/hosts
echo $IP `hostname` >> /etc/hosts

adduser --disabled-password --gecos "" $@

sudo -u hdfs hdfs namenode -format
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done

sudo -u hdfs hadoop fs -rm -r /tmp
sudo -u hdfs hadoop fs -mkdir /tmp
sudo -u hdfs hadoop fs -chmod -R 1777 /tmp

sudo -u hdfs hadoop fs -mkdir /tmp/hadoop-yarn/staging
sudo -u hdfs hadoop fs -chmod -R 1777 /tmp/hadoop-yarn/staging

sudo -u hdfs hadoop fs -mkdir /tmp/hadoop-yarn/staging/history/done_intermediate
sudo -u hdfs hadoop fs -chmod -R 1777 /tmp/hadoop-yarn/staging/history/done_intermediate

sudo -u hdfs hadoop fs -chown -R mapred:mapred /tmp/hadoop-yarn/staging

sudo -u hdfs hadoop fs -mkdir /var/log/hadoop-yarn
sudo -u hdfs hadoop fs -chown yarn:mapred /var/log/hadoop-yarn

sudo -u hdfs hadoop fs -mkdir /user/$@ 
sudo -u hdfs hadoop fs -chown $@ /user/$@

service hadoop-yarn-resourcemanager start
service hadoop-yarn-nodemanager start
service hadoop-mapreduce-historyserver start

tail -f /var/log/hadoop-*/*-`hostname`.log
