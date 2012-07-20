#!/usr/bin/env python
# -*- coding: utf-8
#
#* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
# File Name : miss-rate.py
# Creation Date : 13-04-2012
# Last Modified : Fri 20 Jul 2012 05:20:02 PM EEST
# Created By : Greg Liras <gregliras@gmail.com>
#_._._._._._._._._._._._._._._._._._._._._.*/
import re
from sys import argv
def cycles(inst, l1_acc, l2_acc, mem_acc):
    l1_time = 1
    l2_time = 20
    mem_time = 300
    cyc = inst+l1_time*l1_acc+l2_time*l2_acc+mem_time*mem_acc
    #print cyc
    return cyc

def accesses(fname):
    f = open(fname)
    r1 = re.compile("Total number of transactions")
    r2 = re.compile("misses")
    transactions = []
    misses = []
    for i in f:
        if re.search(r1,i):
            transactions.append(int(i.split(':')[-1]))
        if re.search(r2,i):
            misses.append(int(i.split(':')[-1]))

    print transactions
    print misses
    ret = {}
    ret['inst'] = transactions[1]
    ret['l1_acc'] = transactions[0] - sum(misses[:3])
    ret['l2_acc'] = transactions[2] - sum(misses[6:])
    ret['mem_acc'] = sum(misses[6:])

    return ret

def miss_ratio(fname):
    f = open(fname)
    r1 = re.compile("misses")
    r2 = re.compile("Total number of transactions")
    misses = []
    transactions = []
    for i in f:
        if re.search(r1,i):
            misses.append(int(i.split(":")[-1].strip()))
        if re.search(r2,i):
            transactions.append(int(i.split(":")[-1].strip()))
    f.close()
    #print misses
    #print transactions
    ret = {}
    ret['l1_miss_rate']=sum(misses[:3])/float(transactions[0])
    ret['l2_miss_rate']=sum(misses[6:])/float(transactions[2])
    return ret



mapping = { "1": '"i,j,k"',
            "2": '"i,k,j"',
            "3": '"j,i,k"',
            "4": '"j,k,i"',
            "5": '"k,i,j"',
            "6": '"k,j,i"'}






def main():
    if len(argv) !=  2:
        print "gimme the file"
        exit(1)
    else:
        f1 = open("l1.dat","a")
        f2 = open("l2.dat","a")
        f3 = open("cycles.dat", "a")
        miss = miss_ratio(argv[1])
        #print miss['l1_miss_rate']
        version = argv[1][7]
        f1.write("{0}\t{1}\n".format(miss['l1_miss_rate'], mapping[version]))
        #print miss['l2_miss_rate']
        f2.write("{0}\t{1}\n".format(miss['l2_miss_rate'], mapping[version]))
        f1.close()
        f2.close()
        data = accesses(argv[1])
        inst = data['inst']
        l1_acc = data['l1_acc']
        l2_acc = data['l2_acc']
        mem_acc = data['mem_acc']
        cyc = cycles(inst, l1_acc, l2_acc, mem_acc)
        #print cyc
        f3.write("{0}\t{1}\n".format(cyc, mapping[version]))
        f3.close()

if __name__=="__main__":
    main()

