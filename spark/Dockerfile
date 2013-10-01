# DOCKER-VERSION 0.6.3
FROM    ubuntu:12.04
MAINTAINER Austin Seipp "aseipp@pobox.com"

# Make sure we have the correct apt setup
RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list

# Install Java
RUN apt-get update
RUN apt-get install -y git wget openjdk-7-jre-headless python2.7 ipython

# Install Shark, Spark & Scala
RUN wget http://www.scala-lang.org/files/archive/scala-2.9.3.tgz
RUN wget http://apache.mirrors.tds.net/incubator/spark/spark-0.8.0-incubating/spark-0.8.0-incubating-bin-cdh4.tgz

RUN mkdir -p /usr/local/opt
RUN tar xvf scala-2.9.3.tgz                     -C /usr/local/opt
RUN tar xvf spark-0.8.0-incubating-bin-cdh4.tgz -C /usr/local/opt
RUN mv /usr/local/opt/spark-0.8.0-incubating-bin-cdh4 /usr/local/opt/spark-0.8.0

# Setup environment
ENV SCALA_HOME  /usr/local/opt/scala-2.9.3
ENV SPARK_HOME  /usr/local/opt/spark-0.8.0

ADD scripts/pyshell.sh       pyshell.sh
ADD scripts/shell.sh         shell.sh
ADD scripts/run-spark.sh     run-spark.sh
ADD scripts/worker.sh        worker.sh
ADD scripts/master.sh        master.sh
ADD scripts/python-run.sh    python-run.sh
ADD scripts/scala-run.sh     scala-run.sh
RUN chmod +x pyshell.sh shell.sh run-spark.sh worker.sh master.sh python-run.sh scala-run.sh

EXPOSE 8888
EXPOSE 8080
EXPOSE 8081
EXPOSE 7077
