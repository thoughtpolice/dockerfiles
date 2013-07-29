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

# Utility script to run HDFS
RUN echo '#!/bin/bash'                                                  >> /opt/start-dfs.sh
# Java needs the correct hostname
RUN echo 'HOST=$(ip -4 addr show eth0 | tail -1 | cut -s -d" " -f6 | cut -d/ -f1)' >> /opt/start-dfs.sh
RUN echo 'rm -f /etc/hosts'                                             >> /opt/start-dfs.sh
RUN echo 'echo 127.0.0.1 localhost   >  /etc/hosts'                     >> /opt/start-dfs.sh
RUN echo 'echo $HOST $(hostname)     >> /etc/hosts'                     >> /opt/start-dfs.sh

# Correctly set up SSH
RUN echo '/usr/sbin/sshd'                                               >> /opt/start-dfs.sh
RUN echo 'su -c "ssh -o StrictHostKeyChecking=no localhost echo SSHing..." - hduser' >> /opt/start-dfs.sh

# Set correct hadoop permissions and launch
RUN echo 'mkdir -p /data/hadoop/nametable /data/hadoop/data'              >> /opt/start-dfs.sh
RUN echo 'chown -R hduser:hadoop /data/hadoop'                            >> /opt/start-dfs.sh
RUN echo 'echo "Y" | su -c "/opt/hadoop-1.1.2/bin/hadoop namenode -format" - hduser' >> /opt/start-dfs.sh
RUN echo 'su -c "/opt/hadoop-1.1.2/bin/start-dfs.sh" - hduser'            >> /opt/start-dfs.sh
RUN echo 'tail -f /opt/hadoop-1.1.2/logs/hadoop-*.log'                    >> /opt/start-dfs.sh

RUN chmod +x /opt/start-dfs.sh

EXPOSE 22

EXPOSE 9000
EXPOSE 9001
EXPOSE 50090
CMD /opt/start-dfs.sh
