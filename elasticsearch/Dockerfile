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

# Install ElasticSearch
RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.5.tar.gz
RUN tar -xaf elasticsearch-0.90.5.tar.gz --strip-components=1
RUN rm elasticsearch-0.90.5.tar.gz

ADD logging.yml config/logging.yml
ADD elasticsearch.yml config/elasticsearch.yml

EXPOSE 9200
EXPOSE 9300
EXPOSE 9292
CMD ["-f"]
ENTRYPOINT ["/bin/elasticsearch"]
