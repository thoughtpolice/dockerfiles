# DOCKER-VERSION 0.6.3
FROM    ubuntu:12.04
MAINTAINER Austin Seipp "aseipp@pobox.com"

# Make sure we have the correct apt setup
RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list

# Update and install python-software-properties
# and anything else
RUN apt-get update
RUN apt-get install python-software-properties less -y

# Install nodejs/redis-server
RUN add-apt-repository ppa:chris-lea/redis-server -y
RUN apt-get update
RUN apt-get install redis-server -y

ADD redis.conf /etc/redis/redis.conf

EXPOSE 6379
CMD redis-server /etc/redis/redis.conf
