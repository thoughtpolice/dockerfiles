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

# Install Discovery Server
RUN wget -O discovery-server-1.16.tar.gz http://search.maven.org/remotecontent?filepath=io/airlift/discovery/discovery-server/1.16/discovery-server-1.16.tar.gz
RUN tar zxf discovery-server-1.16.tar.gz
RUN rm discovery-server-1.16.tar.gz

RUN mkdir -p /discovery-data
RUN mkdir -p /discovery-server-1.16/etc
ADD etc      /discovery-server-1.16/etc

VOLUME /discovery-data
EXPOSE 8411

CMD ["run"]
ENTRYPOINT ["/discovery-server-1.16/bin/launcher"]
