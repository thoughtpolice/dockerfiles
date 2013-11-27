# DOCKER-VERSION 0.6.6
FROM    ubuntu:12.10
MAINTAINER Austin Seipp "aseipp@pobox.com"

# Make sure we have the correct apt setup
RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu quantal main universe multiverse > /etc/apt/sources.list

# Update and install python-software-properties
# and anything else
RUN apt-get update
RUN apt-get install python-software-properties less wget openjdk-7-jre-headless -y

# Install Discovery Server
RUN wget -O presto-server-0.54.tar.gz http://search.maven.org/remotecontent?filepath=com/facebook/presto/presto-server/0.54/presto-server-0.54.tar.gz
RUN tar zxf presto-server-0.54.tar.gz
RUN rm presto-server-0.54.tar.gz

RUN mkdir -p /presto-data
RUN mkdir -p /presto-server-0.54/etc
ADD etc      /presto-server-0.54/etc

VOLUME /presto-data
EXPOSE 8080

CMD ["run"]
ENTRYPOINT ["/presto-server-0.54/bin/launcher"]
