#!/bin/bash

export LD_LIBRARY_PATH=/home/meng/jaguar/lib
ulimit -c unlimited
myclass=TestStreaming

MY_LIB=../lib/
JARS=$MY_LIB/spark-streaming_2.10-2.1.1.jar,$MY_LIB/spark-streaming-kafka_2.10-1.6.3.jar,$MY_LIB/kafka_2.10-0.8.2.1.jar,$MY_LIB/zkclient-0.3.jar,$MY_LIB/metrics-core-2.2.0.jar,$MY_LIB/kafka-clients-0.8.2.1.jar,$MY_LIB/jaguar-jdbc-2.0.jar,$MY_LIB/spark-assembly-1.5.2-hadoop2.6.0.jar

PROJJAR=../target/scala-2.10/testjdbc_2.10-1.0.jar

export SPARK_HOME=/home/meng/jaguarspark

t1=`date +'%s'`

/home/meng/jaguarspark/bin/spark-submit \
    --class $myclass \
    --jars $JARS \
    --master local[16] \
    --driver-library-path $LD_LIBRARY_PATH \
    $PROJJAR


t2=`date +'%s'`
((dt=t2-t1))
date
echo "Total $t1 --- $t2  $dt seconds"

## --conf "yarn.nodemanager.delete.debug-delay-sec=36000" 
## --master local[3] \
## --master yarn \
