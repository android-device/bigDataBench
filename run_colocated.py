#!/usr/bin/python
#please sudo su before running
from optparse import OptionParser
import os
import signal
import sys
import thread
from threading import Thread
def signal_handler(signal, frame):
    print('You pressed Ctrl+C!')
    sys.exit(0)
    quit()

def parse():
    parser = OptionParser()
    #parser.add_option("-p", "--path", action="store", help="directory to dump the logs\n")
    parser.add_option("-c", "--command", action="store", help="command")
    parser.add_option("-d", "--command2", action="store", help="command to run alongside the first")
    parser.add_option("-s", "--socket", action="store", help="socket_id")
    (options, args) = parser.parse_args()

    if not options.command:
        parser.print_help()
        parser.error("Wrong number of arguments")

    return options

masks=['0x00003', '0x00007','0x0000F',\
       '0x0001F', '0x0003F', '0x0007F', '0x000FF',\
       '0x001FF', '0x003FF', '0x007FF', '0x00FFF',\
       '0x01FFF', '0x03FFF', '0x07FFF', '0x0FFFF',\
       '0x1FFFF', '0x3FFFF']

c_masks=['0xFFFFC', '0xFFFF8','0xFFFF0',\
       '0xFFFE0', '0xFFFC0', '0xFFF80', '0xFFF00',\
       '0xFFE00', '0xFFC00', '0xFF800', '0xFF000',\
       '0xFE000', '0xFC000', '0xF8000', '0xF0000',\
       '0xE0000', '0xC0000']

options=parse()
#if int(options.socket) == 0:
#	offset=0
#elif int(options.socket) == 1:
#	offset=16

def run_workload(cmd):
    print cmd
    os.system(cmd)

# calculate the reference LLCMiss and IPC
num_partitions=18
num_cores=7
for i in range(5):
    # thrash llc
    cmd = "./thrash_cache.o"
    os.system(cmd)
    allocation_list_str ="llc:0={}-{}, llc:1={}-{}".format(0, num_cores, num_cores+1, 7)
    #print "{}-{}".format(num_partitions, num_cores)
    cmd= "sudo pqos -e {} -a {}".format(partition_list_str, allocation_list_str)
    print cmd
    os.system(cmd)
    log_name="log-0-{}-{}-{}.txt".format(num_partitions, num_cores, i)
            cmd= "perf stat -e cycles,cache-references,instructions,LLC-loads,LLC-load-misses,LLC-stores,LLC-prefetches -o {} taskset -c {}-{} {}".format(log_name, 0, num_cores, options.command, log_name)

    w1=Thread(run_workload(cmd))
    #calculate cmd of the other workload
            log_name="log-1-{}-{}-{}.txt".format(num_partitions, num_cores, i)
            cmd= "perf stat -e cycles,cache-references,instructions,LLC-loads,LLC-load-misses,LLC-stores,LLC-prefetches -o {} taskset -c {}-{} {}".format(log_name, num_cores+1, 7, options.command2, log_name)


for num_partitions in range(17) : #change number of ways from 1 to 20
    partition_list_str = "llc:0={}, llc:1={}".format(masks[num_partitions],c_masks[num_partitions])

    for num_cores in range(7): #change number of cores for the workload from 1 to 8
        for i in range(5):
            # thrash llc
            cmd = "./thrash_cache.o"
            os.system(cmd)
            allocation_list_str ="llc:0={}-{}, llc:1={}-{}".format(0, num_cores, num_cores+1, 7)
            #print "{}-{}".format(num_partitions, num_cores)
            cmd= "sudo pqos -e {} -a {}".format(partition_list_str, allocation_list_str)
            print cmd
            os.system(cmd)

            (out, err) = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()
            out=out.split("\n")[:-1]
            IPC=out[7].split(" ")[3]
            LLCMisses[9].split(" ")[3]

            log_name="log-0-{}-{}-{}.txt".format(num_partitions, num_cores, i)
            cmd= "perf stat -e cycles,cache-references,instructions,LLC-loads,LLC-load-misses,LLC-stores,LLC-prefetches -o {} taskset -c {}-{} {}".format(log_name, 0, num_cores, options.command, log_name)
            w1=Thread(run_workload(cmd))
            #calculate cmd of the other workload
            log_name="log-1-{}-{}-{}.txt".format(num_partitions, num_cores, i)
            cmd= "perf stat -e cycles,cache-references,instructions,LLC-loads,LLC-load-misses,LLC-stores,LLC-prefetches -o {} taskset -c {}-{} {}".format(log_name, num_cores+1, 7, options.command2, log_name)

            w1=Thread(run_workload(cmd))
            w2=Thread(run_workload(cmd))
            w1.start()
            w2.start()
            w1.join()
            w2.join()
