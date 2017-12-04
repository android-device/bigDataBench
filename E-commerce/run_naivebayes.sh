#!/bin/bash
WORK_DIR=`pwd`
HADOOP_CONF_DIR=/users/josers2/hadoop-2.8.1/etc/hadoop
cd mahout-distribution-0.6/bin
./mahout testclassifier -m /Bayes/model -d  ${WORK_DIR}/data-naivebayes/testdata

