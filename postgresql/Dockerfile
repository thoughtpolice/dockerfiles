# DOCKER-VERSION 0.6.3
FROM    ubuntu:12.04
MAINTAINER Austin Seipp "aseipp@pobox.com"

# Make sure we have the correct apt setup
RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list
RUN echo deb http://apt.postgresql.org/pub/repos/apt precise-pgdg main > /etc/apt/sources.list.d/pgdg.list
ADD ACCC4CF8.asc /root/ACCC4CF8.asc
RUN apt-key add /root/ACCC4CF8.asc

# Go
RUN apt-get update
RUN apt-get install postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3 -y

# Setup permissions
ADD postgres-setup.sh /root/postgres-setup.sh
ADD postgres-setup.sh.conf /root/postgres-setup.sh.conf
RUN /etc/init.d/postgresql restart && chmod +x /root/postgres-setup.sh && /root/postgres-setup.sh && /etc/init.d/postgresql stop
RUN rm /root/postgres-setup.sh /root/postgres-setup.sh.conf

# Add config files
ADD pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ADD postgresql.conf /etc/postgresql/9.3/main/postgresql.conf

EXPOSE 5432
CMD /bin/su postgres -c '/usr/lib/postgresql/9.3/bin/postgres -D /var/lib/postgresql/9.3/main -c config_file=/etc/postgresql/9.3/main/postgresql.conf'
