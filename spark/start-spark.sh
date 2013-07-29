#!/bin/bash
HOST=$(ip -4 addr show eth0 | tail -1 | cut -s -d" " -f6 | cut -d/ -f1)
rm -f /etc/hosts
echo 127.0.0.1 $(hostname) >  /etc/hosts
echo $HOST $(hostname)     >> /etc/hosts
/opt/spark-0.7.2/run $@ -i $HOST -p 7077 --webui-port 8080
