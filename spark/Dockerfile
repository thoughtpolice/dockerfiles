# DOCKER-VERSION 0.5
FROM    ubuntu:12.04
MAINTAINER Austin Seipp "aseipp@pobox.com"

# Make sure we have the correct apt setup
RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list

# Install Java
RUN apt-get update
RUN apt-get install wget openjdk-7-jre-headless -y

# Install Shark, Spark & Scala
RUN wget http://www.scala-lang.org/downloads/distrib/files/scala-2.9.3.tgz
RUN wget http://spark-project.org/download/spark-0.7.2-prebuilt-hadoop1.tgz
RUN wget http://spark-project.org/download/shark-0.7.0-hadoop1-bin.tgz
RUN wget http://apache.mesi.com.ar/hadoop/common/hadoop-1.1.2/hadoop-1.1.2-bin.tar.gz
RUN tar -zxvf scala-2.9.3.tgz -C /opt/
RUN tar -zxvf spark-0.7.2-prebuilt-hadoop1.tgz -C /opt/
RUN tar -zxvf shark-0.7.0-hadoop1-bin.tgz -C /opt/
RUN tar -zxvf hadoop-1.1.2-bin.tar.gz -C /opt/
RUN rm *.tgz *.tar.gz

# Setup environment
ENV SCALA_HOME  /opt/scala-2.9.3
ENV SPARK_HOME  /opt/spark-0.7.2
ENV HIVE_HOME   /opt/hive-0.9.0-bin
ENV HADOOP_HOME /opt/hadoop-1.1.2
ENV SHARK_HOME  /opt/shark-0.7.0

# Utility scripts to run Spark
RUN echo '#!/bin/bash'                                                  >> /opt/start-spark.sh
RUN echo 'HOST=$(ip -4 addr show eth0 | tail -1 | cut -s -d" " -f6 | cut -d/ -f1)' >> /opt/start-spark.sh
RUN echo 'rm -f /etc/hosts'                                             >> /opt/start-spark.sh
RUN echo 'echo 127.0.0.1 $(hostname) >  /etc/hosts'                     >> /opt/start-spark.sh
RUN echo 'echo $HOST $(hostname)     >> /etc/hosts'                     >> /opt/start-spark.sh
RUN echo '/opt/spark-0.7.2/run $@ -i $HOST -p 7077 --webui-port 8080'   >> /opt/start-spark.sh

RUN echo '#!/bin/bash'                                       >> /opt/start-spark-master.sh
RUN echo '/opt/start-spark.sh spark.deploy.master.Master $@' >> /opt/start-spark-master.sh

RUN echo '#!/bin/bash'                                       >> /opt/start-spark-worker.sh
RUN echo '/opt/start-spark.sh spark.deploy.worker.Worker $@' >> /opt/start-spark-worker.sh

RUN chmod +x /opt/start-spark.sh /opt/start-spark-master.sh /opt/start-spark-worker.sh

EXPOSE 8080
EXPOSE 7077
CMD /opt/start-spark-master.sh
