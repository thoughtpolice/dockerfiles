#!/bin/bash
HOST=$(ip -4 addr show eth0 | tail -1 | cut -s -d" " -f6 | cut -d/ -f1)
rm -f /etc/hosts
echo 127.0.0.1 localhost   >  /etc/hosts
echo $HOST $(hostname)     >> /etc/hosts
/usr/sbin/sshd
su -c "ssh -o StrictHostKeyChecking=no localhost echo SSHing..." - hduser
mkdir -p /data/hadoop/nametable /data/hadoop/data
chown -R hduser:hadoop /data/hadoop
echo "Y" | su -c "/opt/hadoop-1.1.2/bin/hadoop namenode -format" - hduser
su -c "/opt/hadoop-1.1.2/bin/start-dfs.sh" - hduser
tail -f /opt/hadoop-1.1.2/logs/hadoop-*.log
