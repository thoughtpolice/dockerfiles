# DOCKER-VERSION 0.5
FROM    ubuntu:12.04
MAINTAINER Austin Seipp "aseipp@pobox.com"

# Make sure we have the correct apt setup
RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list

# Update and install python-software-properties
# and anything else
RUN apt-get update
RUN apt-get install python-software-properties less git -y

# Install nodejs/redis-server
RUN add-apt-repository ppa:chris-lea/node.js -y
RUN apt-get update
RUN apt-get install nodejs -y

# Install and create hubot
RUN npm install -g hubot coffee-script
RUN hubot --create .
RUN npm install hubot-irc --save
RUN npm install
RUN chmod +x bin/hubot

# Add scripts
ADD hubot-scripts.json hubot-scripts.json

CMD /bin/hubot
