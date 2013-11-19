# DOCKER-VERSION 0.6.6
FROM    ubuntu:12.04
MAINTAINER Austin Seipp "aseipp@pobox.com"

# Make sure we have the correct apt setup
RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list

# Update and install python-software-properties
# and anything else
RUN apt-get update
RUN apt-get install python-software-properties less wget openjdk-7-jre-headless -y

# Download Minecraft server
RUN wget https://s3.amazonaws.com/Minecraft.Download/versions/1.7.2/minecraft_server.1.7.2.jar

RUN mkdir -p /minecraft
WORKDIR /minecraft
VOLUME /minecraft

EXPOSE 25565
ENTRYPOINT ["/usr/bin/java","-Xmx2048M", "-Xms2048M", "-jar","/minecraft_server.1.7.2.jar"]
