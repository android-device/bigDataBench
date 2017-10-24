#!/bin/bash
##
# Use the amazon E-com dataset, trains and tests a recommendator.
# Need HADOOP and MAHOUT
# To prepare and generate data:
# ./genData_recommendator.sh
# To run:
# ./run_recommendator.sh
##

echo "Generate E-com-recommendator data"

WORK_DIR=`pwd`       

I=16

#mkdir $WORK_DIR/data-recommendator
#read -p "Please Enter The Iterations of GenGragh: " I

#echo "WORK_DIR=$WORK_DIR data will be generate in $WORK_DIR/data-recommendator"

#/////////////////////////////////////////////////////////////////////////////
#Parameters:
# -o:Output graph file name (default:'graph.txt')
# -m:Matrix (in Maltab notation) (default:'0.9 0.5; 0.5 0.1')
# -i:Iterations of Kronecker product (default:5)
# -s:Random seed (0 - time seed) (default:0)
#/////////////////////////////////////////////////////////////////////////////

#../BigDataGeneratorSuite/Graph_datagen/gen_kronecker_graph -o:$WORK_DIR/data-recommendator/Amazon_genGragh_$I.txt -m:"0.7196 0.6313; 0.4833 0.3601" -i:$I

#head -4 $WORK_DIR/data-recommendator/Amazon_genGragh_$I.txt > $WORK_DIR/data-recommendator/Amazon_parameters_$I
#sed 1,4d $WORK_DIR/data-recommendator/Amazon_genGragh_$I.txt > $WORK_DIR/data-recommendator/Amazon_genGragh_$I.tmp

#mv $WORK_DIR/data-recommendator/Amazon_genGragh_$I.tmp $WORK_DIR/data-recommendator/Amazon_genGragh_$I.txt

#$HADOOP_HOME/bin/hadoop fs -rmr $WORK_DIR/data-recommendator/Amazon_genGragh_$I.txt

echo "copyFromLocal To HDFS!"
echo "$WORK_DIR/data-recommendator"
$HADOOP_HOME/bin/hadoop fs -mkdir -p $WORK_DIR/data-recommendator
$HADOOP_HOME/bin/hadoop fs -put $WORK_DIR/data-recommendator/Amazon_genGragh_$I.txt $WORK_DIR/data-recommendator

