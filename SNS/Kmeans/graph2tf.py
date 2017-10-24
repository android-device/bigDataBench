#!/bin/env python 
import sys

i=int(sys.argv[1])
filename='./data-kmeans/Facebook_genGragh_'+sys.argv[1]+'.txt'
infile=file(filename)
outfile=file('./data-kmeans/kmeans_input_data','w')

#print i

result = [[0 for col in range(2**i)] for row in range(2**i)]

for line in infile:
    words=line.lower().strip().split()
    #print words[1]
    result[int(words[0])][int(words[1])]=1

for num_i in range(0,2**i):
    #sum=0
    #tmp=0
    for num_j in range(0,2**i):
        outfile.write(str(float(result[num_i][num_j]))+" ")
        #if result[num_i][num_j]!=0:
            #if sum==0:
                #outfile.write('{')
                #tmp=1
            #sum+=1
            #outfile.write(str(num_j)+":1,")
    #if tmp==1:
    outfile.write('\n')

'''
tf={}
    for wd in words:
        if wd in tf:
            tf[wd]+=1
        else:
            tf[wd]=1
    tff={}
    for wd in tf:
        if wd in vocab:
            tff[vocab[wd]]=tf[wd]
    outfile.write(str(len(tff)))
    for wd in tff:
        outfile.write(" "+str(wd)+":"+str(tff[wd]))
    outfile.write('\n')
''' 
