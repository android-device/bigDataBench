#!/bin/bash
##
# Micro Benchmarks Workload: sort, grep, wordcount
# Need HADOOP
# To prepare and generate data:
#  ./genData_MicroBenchmarks.sh
# To run:
#  ./run_MicroBenchmarks.sh
##

#if [ ! -e $HADOOP ]; then
#  echo "Can't find hadoop in $HADOOP, exiting"
#  exit 1
#fi

echo "Preparing MicroBenchmarks data dir"

WORK_DIR=`pwd`
echo "WORK_DIR=$WORK_DIR data will be put in $WORK_DIR/data-MicroBenchmarks/in"

#mkdir -p ${WORK_DIR}/data-MicroBenchmarks/in

cd ../BigDataGeneratorSuite/Text_datagen/

echo "print data size GB :"
read GB
a=${GB}
let L=a*2
./gen_text_data.sh lda_wiki1w $L 8000 10000 ${WORK_DIR}/data-MicroBenchmarks/in

cd ../../MicroBenchmarks/

${HADOOP_HOME}/bin/hadoop fs -mkdir -p ${WORK_DIR}/data-MicroBenchmarks/
${HADOOP_HOME}/bin/hadoop fs -put ${WORK_DIR}/data-MicroBenchmarks/in ${WORK_DIR}/data-MicroBenchmarks

