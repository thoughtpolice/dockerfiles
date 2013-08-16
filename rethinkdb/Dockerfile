# DOCKER-VERSION 0.5
FROM    ubuntu:12.04
MAINTAINER Austin Seipp "aseipp@pobox.com"

# Make sure we have the correct apt setup
RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list

# Update and install python-software-properties
# and anything else
RUN apt-get update
RUN apt-get install python-software-properties less -y

# Install RethinkDB
RUN add-apt-repository ppa:rethinkdb/ppa -y
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install rethinkdb -y

# Set correct permissions for /data
RUN mkdir /data
RUN chown -R rethinkdb:rethinkdb /data

EXPOSE 8080
EXPOSE 29015
EXPOSE 28015
CMD rethinkdb --bind all -d /data/rethinkdb --runuser rethinkdb --rungroup rethinkdb
