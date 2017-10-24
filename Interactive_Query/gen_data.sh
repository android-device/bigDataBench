#!/bin/bash
##put talbes data to data file
rm -fr data/*
rm -fr metastore_db
rm -fr derby.log
rm -fr TempStatsStore
WORK_DIR=`pwd`
cd $BigdataBench_Home/BigDataGeneratorSuite/Table_datagen/e-com
./generate_table.sh
mv output/* $WORK_DIR/data
cd $BigdataBench_Home/Interactive_Query
hadoop dfs -rmr /hive
hadoop dfs -mkdir -p /hive/item
hadoop dfs -mkdir -p /hive/order
hadoop dfs -put $BigdataBench_Home/Interactive_Query/data/OS_ORDER.txt /hive/order/
hadoop dfs -put $BigdataBench_Home/Interactive_Query/data/OS_ORDER_ITEM.txt /hive/item/
hive -f hive.sql
