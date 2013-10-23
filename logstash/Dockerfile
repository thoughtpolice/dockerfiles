# DOCKER-VERSION 0.6.4
FROM    ubuntu:12.04
MAINTAINER Austin Seipp "aseipp@pobox.com"

# Make sure we have the correct apt setup
RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list

# Update and install python-software-properties
# and anything else
RUN apt-get update
RUN apt-get install python-software-properties less wget openjdk-7-jre-headless -y

# Install Logstash
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar

ENTRYPOINT ["/usr/bin/java","-jar","logstash-1.2.2-flatjar.jar"]
