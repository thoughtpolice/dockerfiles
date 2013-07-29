# DOCKER-VERSION 0.5
FROM    ubuntu:12.04
MAINTAINER Austin Seipp "aseipp@pobox.com"

# Make sure we have the correct apt setup
RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list

# Install Java and SSH
RUN apt-get update
RUN apt-get install wget openjdk-7-jre-headless openssh-server -y
RUN mkdir /var/run/sshd

# Install Hadoop, update configuration
RUN wget http://apache.mesi.com.ar/hadoop/common/hadoop-1.1.2/hadoop-1.1.2-bin.tar.gz
RUN tar -zxvf hadoop-1.1.2-bin.tar.gz -C /opt/
RUN rm *.tar.gz

ADD conf/core-site.xml /opt/hadoop-1.1.2/conf/
ADD conf/hdfs-site.xml /opt/hadoop-1.1.2/conf/
ADD conf/mapred-site.xml /opt/hadoop-1.1.2/conf/

# Make sure JAVA_HOME and HADOOP_OPTS are set properly
RUN echo 'export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")' >> /opt/hadoop-1.1.2/conf/hadoop-env.sh
RUN echo 'export HADOOP_OPTS=-Djava.net.preferIPv4Stack=true' >> /opt/hadoop-1.1.2/conf/hadoop-env.sh

# Add user and set permissions
RUN addgroup hadoop
RUN adduser --disabled-password --gecos "" --ingroup hadoop hduser
RUN chown -R hduser:hadoop /opt/hadoop-1.1.2/
RUN mkdir /home/hduser/.ssh
RUN ssh-keygen -t rsa -N "" -f /home/hduser/.ssh/id_rsa
RUN cp /home/hduser/.ssh/id_rsa.pub /home/hduser/.ssh/authorized_keys
RUN chown -R hduser:hadoop /home/hduser/.ssh

ADD start-dfs.sh /opt/start-dfs.sh
RUN chmod +x /opt/start-dfs.sh

EXPOSE 22

EXPOSE 9000
EXPOSE 9001
EXPOSE 50070
EXPOSE 50090
CMD /opt/start-dfs.sh
