#!/bin/bash
NAME=$1; shift; CLASS=$1; shift; ARGS=$@
cd /host-data/$NAME && $SPARK_HOME/sbt/sbt package "run-main $CLASS $ARGS"
