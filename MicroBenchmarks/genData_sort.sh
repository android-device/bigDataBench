#/usr/bin/bash
hadoop dfs -rmr /sort-data
echo "print data size GB :"
#read GB
let GB=1
hadoop jar ${HADOOP_HOME}/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar randomwriter -D mapreduce.randomwriter.bytespermap=1073741824 -D mapreduce.randomwriter.mapsperhost=$GB /sort-data
