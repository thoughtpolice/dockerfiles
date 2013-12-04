# DOCKER-VERSION 0.6.3
FROM    ubuntu:12.04
MAINTAINER Austin Seipp "aseipp@pobox.com"

# Make sure we have the correct apt setup
RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list

# Update and install python-software-properties
# and anything else
RUN apt-get update
RUN apt-get install python-software-properties less git -y

# Install nodejs
RUN add-apt-repository ppa:chris-lea/node.js -y
RUN apt-get update && apt-get install nodejs -y

# Install and create hubot
RUN npm install -g hubot coffee-script
RUN hubot --create hubot
ADD hubot-scripts.json hubot/hubot-scripts.json

RUN cd hubot && npm install hubot-irc --save && npm install
RUN chmod +x hubot/bin/hubot

WORKDIR /hubot
CMD ["-a","irc","--name","$HUBOT_IRC_NICK"]
ENTRYPOINT ["/hubot/bin/hubot"]
