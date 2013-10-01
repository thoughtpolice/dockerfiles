#!/bin/bash
docker run -i -t -v `pwd`:/host-data thoughtpolice/spark sh python-run.sh $@
