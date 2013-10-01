#!/bin/bash
mkdir -p `pwd`/.sbt `pwd`/.ivy2
docker run -i -t -v `pwd`:/host-data -v `pwd`/.sbt:/root/.sbt -v `pwd`/.ivy2:/root/.ivy2 thoughtpolice/spark sh scala-run.sh $@
