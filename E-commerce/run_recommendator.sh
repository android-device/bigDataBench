#!/bin/bash
##
# Use the amazon E-com dataset, trains and tests a recommendator.
# Need HADOOP and MAHOUT
# To prepare and generate data:
# ./genData_recommendator.sh
# To run:
# ./run_recommendator.sh
##


MAHOUT_HOME=mahout-distribution-0.9
echo "Preparing E-com-recommendator data dir"

WORK_DIR=`pwd`

echo "WORK_DIR=$WORK_DIR data should be put in $WORK_DIR/data-recommendator"

echo "MAHOUT_HOME=$MAHOUT_HOME"
#read -p "Please Enter The Iterations of GenGragh: " I
I=16

#Run Recommendator 
echo "Run Recommendator "

#hadoop fs -rmr ${WORK_DIR}/data-recommendator/Amazon_out

time hadoop jar ${MAHOUT_HOME}/mahout-core-*-job.jar org.apache.mahout.cf.taste.hadoop.item.RecommenderJob\
 -i ${WORK_DIR}/data-recommendator/Amazon_genGragh_$I.txt \
 -o ${WORK_DIR}/data-recommendator/Amazon_out/out \
 --similarityClassname SIMILARITY_COOCCURRENCE \
 --tempDir ${WORK_DIR}/data-recommendator/Amazon_out/tmp 
