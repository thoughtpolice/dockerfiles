# DOCKER-VERSION 0.5
FROM    ubuntu:12.04
MAINTAINER Austin Seipp "aseipp@pobox.com"

# Make sure we have the correct apt setup
RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list

# Install Java
RUN apt-get update
RUN apt-get install wget openjdk-7-jre-headless -y

# Install riemann
RUN wget http://aphyr.com/riemann/riemann_0.2.2_all.deb
RUN dpkg -i riemann_0.2.2_all.deb
RUN rm riemann_0.2.2_all.deb

# Install riemann-dash
RUN apt-get install build-essential rubygems1.9.1 ruby1.9.1-dev -y
RUN gem install riemann-dash

ADD riemann.config /etc/riemann/riemann.config
ADD config.rb config.rb

ADD start-riemann.sh /opt/start-riemann.sh
RUN chmod +x /opt/start-riemann.sh

EXPOSE 4567
EXPOSE 5555
EXPOSE 5555/udp
EXPOSE 5556
CMD /opt/start-riemann.sh
