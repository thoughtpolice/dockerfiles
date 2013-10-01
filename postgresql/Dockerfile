# DOCKER-VERSION 0.6.3
FROM    ubuntu:12.04
MAINTAINER Austin Seipp "aseipp@pobox.com"

# Make sure we have the correct apt setup
RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install wget

# Go
RUN echo deb http://apt.postgresql.org/pub/repos/apt precise-pgdg main > /etc/apt/sources.list.d/pgdg.list
RUN wget --no-check-certificate --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

# Setup permissions
ADD scripts/postgres-setup.sh /root/postgres-setup.sh
ADD postgres-setup.sh.conf /root/postgres-setup.sh.conf
RUN chmod +x /root/postgres-setup.sh
RUN /etc/init.d/postgresql restart && /root/postgres-setup.sh && /etc/init.d/postgresql stop
RUN rm /root/postgres-setup.sh /root/postgres-setup.sh.conf

# Add config files
ADD conf/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ADD conf/postgresql.conf /etc/postgresql/9.3/main/postgresql.conf

# Add scripts
ADD scripts/server.sh server.sh

EXPOSE 5432
CMD ["sh", "/server.sh"]
