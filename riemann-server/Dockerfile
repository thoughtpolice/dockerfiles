# DOCKER-VERSION 0.5
FROM    ubuntu:12.04
MAINTAINER Austin Seipp "aseipp@pobox.com"

# Make sure we have the correct apt setup
RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list

# Install Java
RUN apt-get update
RUN apt-get install wget default-jre-headless -y

# Install riemann
RUN wget http://aphyr.com/riemann/riemann_0.2.2_all.deb
RUN dpkg -i riemann_0.2.2_all.deb
RUN rm riemann_0.2.2_all.deb

ADD riemann.config /etc/riemann/riemann.config

EXPOSE 5555
EXPOSE 5555/udp
EXPOSE 5556
CMD echo 127.0.0.1 $(hostname) > /etc/hosts; /usr/bin/riemann -a /etc/riemann/riemann.config
