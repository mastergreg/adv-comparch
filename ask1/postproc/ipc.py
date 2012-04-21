#!/usr/bin/env python
# -*- coding: utf-8
#
#* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
# File Name : proc.py
# Creation Date : 13-04-2012
# Last Modified : Fri 13 Apr 2012 02:28:54 AM EEST
# Created By : Greg Liras <gregliras@gmail.com>
#_._._._._._._._._._._._._._._._._._._._._.*/

from sys import argv
import re

def cycles(inst, l1_acc, l2_acc, mem_acc):
    l1_time = 1
    l2_time = 20
    mem_time = 300
    cyc = inst+l1_time*l1_acc+l2_time*l2_acc+mem_time*mem_acc
    return cyc

def accesses(fname):
    f = open(fname)
    r1 = re.compile("Instruction fetch")
    instructionData = []
    for i in f:
        if re.search(r1,i):
            instructionData.append(i.split(":")[-1].strip())
    instructionData = filter(lambda x: x is not '0', instructionData)
    #print instructionData
    labels = ['l1_acc','l2_acc','l1_hit_ratio','l2_acc','mem_acc','l2_hit_ratio']
    ret = dict(zip(labels,instructionData))
    return ret


def main():
    #l1_acc, l2_acc, mem_acc,miss-rates = accesses(argv[1])
    f = open("datafiles","r")
    labels = ['l1_acc','l2_acc','l1_hit_ratio','l2_acc','mem_acc','l2_hit_ratio']
    for i,df in enumerate(f):
        data = accesses(df.strip())
        inst = int(data['l1_acc'])
        l1_acc = inst
        l2_acc = int(data['l1_acc'])
        mem_acc = int(data['mem_acc'])
        cyc = cycles(inst, l1_acc, l2_acc, mem_acc)
        IPC = float(inst)/float(cyc)
        print i+1,IPC
if __name__=="__main__":
    main()

