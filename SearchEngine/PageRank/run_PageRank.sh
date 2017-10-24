#!/bin/bash
##
# Use the Google dataset, Run PageRank-plain, a PageRank calculation algorithm on hadoop.
# Need HADOOP and PEGASUS
# To prepare and generate data:
# ./genData_PageRank.sh
# To run:
# ./run_PageRank.sh [#_of_nodes]
##

WORK_DIR=`pwd`

I1=20
let "I=2**$I1"
#I=$1

echo $I
reducers=16
flag=makesym #nosym
echo "[#_of_nodes] : number of nodes in the graph is" $I
echo "[#_of_reducers] : number of reducers to use in hadoop is" $reducers
echo "[makesym or nosym] : makesym-duplicate reverse edges, nosym-use original edge file" $flag
echo "[#_Iterations_of_GenGragh] : Iterations_of_GenGragh is" $I1


#hadoop dfs -rmr /user/$USER/pr_tempmv
#hadoop dfs -rmr /user/$USER/pr_output
#hadoop dfs -rmr /user/$USER/pr_minmax
#hadoop dfs -rmr /user/$USER/pr_distr
#hadoop dfs -rmr /user/$USER/pr_vector

#hadoop jar pegasus-2.0.jar pegasus.PagerankNaive $WORK_DIR/data-PageRank/Google_genGraph_$1.txt pr_tempmv pr_output $I $reducers 1024 $flag new
time hadoop jar pegasus-2.0.jar pegasus.PagerankNaive  $WORK_DIR/data-PageRank/Google_genGraph_$I1.txt pr_tempmv pr_output $I $reducers 1 $flag new
#hadoop jar pegasus-2.0.jar pegasus.PagerankNaive  /root/ljw/bigdatabench-spark-1.0/SearchEngine/Pagerank/data-PageRank/Google_genGraph_6.txt pr_tempmv pr_output $I $reducers 1024 $flag new

