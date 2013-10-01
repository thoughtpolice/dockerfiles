#!/bin/bash
NAME=$1; shift; ARGS=$@
cd $SPARK_HOME && ./pyspark /host-data/$NAME $ARGS
