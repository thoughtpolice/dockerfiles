#!/bin/bash
HOST=$(ip -4 addr show eth0 | tail -1 | cut -s -d" " -f6 | cut -d/ -f1)
rm -f /etc/hosts
echo 127.0.0.1 localhost   >  /etc/hosts
echo $HOST $(hostname)     >> /etc/hosts
/usr/local/bin/riemann-dash &
/usr/bin/riemann -a /etc/riemann/riemann.config
