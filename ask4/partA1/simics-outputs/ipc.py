#!/usr/bin/env python
# -*- coding: utf-8
#
#* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
# File Name : proc.py
# Creation Date : 13-04-2012
# Last Modified : Sun 22 Apr 2012 07:49:01 PM EEST
# Created By : Greg Liras <gregliras@gmail.com>
#_._._._._._._._._._._._._._._._._._._._._.*/

from sys import argv
import re

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

    ret = {}
    ret['inst'] = transactions[1]
    ret['l1_acc'] = transactions[0] - sum(misses[0:4])
    ret['l2_acc'] = transactions[2] - sum(misses[6:])
    ret['mem_acc'] = sum(misses[6:])
    #print misses
    #print ret

    return ret


def main():
    #l1_acc, l2_acc, mem_acc,miss-rates = accesses(argv[1])
    f = open("datafiles","r")
    ipcs=[]
    for df in f:
        data = accesses(df.strip())
        inst = data['inst']
        l1_acc = data['l1_acc']
        l2_acc = data['l2_acc']
        mem_acc = data['mem_acc']
        cyc = cycles(inst, l1_acc, l2_acc, mem_acc)
        IPC = float(inst)/float(cyc)
        ipcs.append(IPC)
    norm = ipcs[0]
    for i,IPC in enumerate(ipcs):
        print i+1,IPC#/norm
if __name__=="__main__":
    main()

