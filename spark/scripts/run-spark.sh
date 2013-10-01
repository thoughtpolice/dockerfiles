#!/bin/bash
HOST=$(ip -4 addr show eth0 | tail -1 | cut -s -d" " -f6 | cut -d/ -f1)
/usr/local/opt/spark-0.8.0/spark-class $@ -h $HOST -p 7077 --webui-port 8080
