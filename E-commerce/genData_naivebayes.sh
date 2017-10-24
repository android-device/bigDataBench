#/bin/bash
##
# Use the amazon naivebayes dataset, trains and tests a classifier.
# Need HADOOP and MAHOUT
# To prepare and generate data:
# ./genData_naivebayes.sh
# To run:
# ./run_naivebayes.sh
##

#bayes-train
WORK_DIR=`pwd`
cd data-naivebayes/
 ${HADOOP_HOME}/bin/hadoop fs -rmr ${WORK_DIR}/data-naivebayes
 ${HADOOP_HOME}/bin/hadoop fs -mkdir /Bayes
 ${HADOOP_HOME}/bin/hadoop fs -rmr /Bayes/model
 ${HADOOP_HOME}/bin/hadoop fs -put model /Bayes

cd ..
echo "Preparing naivebayes-naivebayes data dir"

WORK_DIR=`pwd`
echo "WORK_DIR=$WORK_DIR data will be generated in $WORK_DIR/data-naivebayes"
##export mahout
#tar -zxvf mahout-distribution-0.6.tar.gz

echo "Preparing naivebayes-naivebayes data dir"
#mkdir -p ${WORK_DIR}/data-naivebayes/amazonMR1
#mkdir -p ${WORK_DIR}/data-naivebayes/amazonMR2
#mkdir -p ${WORK_DIR}/data-naivebayes/amazonMR3
#mkdir -p ${WORK_DIR}/data-naivebayes/amazonMR4
#mkdir -p ${WORK_DIR}/data-naivebayes/amazonMR5

cd ../BigDataGeneratorSuite/Text_datagen/
echo "print data size GB :"
#read GB
GB=1
a=${GB}
let L=a*2
#./gen_text_data.sh amazonMR1 $L 1900 11500 ${WORK_DIR}/data-naivebayes/amazonMR1
#./gen_text_data.sh amazonMR2 $L 1900 11500 ${WORK_DIR}/data-naivebayes/amazonMR2
#./gen_text_data.sh amazonMR3 $L 1900 11500 ${WORK_DIR}/data-naivebayes/amazonMR3
#./gen_text_data.sh amazonMR4 $L 1900 11500 ${WORK_DIR}/data-naivebayes/amazonMR4
#./gen_text_data.sh amazonMR5 $L 1900 11500 ${WORK_DIR}/data-naivebayes/amazonMR5
cd ../../E-commerce/data-naivebayes

#python dataread.py $1 $2  you can change the number 
#$1:A number of storage folder
#$2:From the first few rows stored
#$1 ad $2 based on amazonMR
#python dataread.py $a 47

${HADOOP_HOME}/bin/hadoop fs -mkdir -p ${WORK_DIR}/data-naivebayes
${HADOOP_HOME}/bin/hadoop fs -put ${WORK_DIR}/data-naivebayes/testdata ${WORK_DIR}/data-naivebayes
echo "Finished copyFromLocal ,before you run_naivebayes,you should tar mahout-0.6 first"


