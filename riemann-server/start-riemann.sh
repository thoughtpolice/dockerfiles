#!/bin/bash
/usr/local/bin/riemann-dash &
/usr/bin/riemann -a /etc/riemann/riemann.config
