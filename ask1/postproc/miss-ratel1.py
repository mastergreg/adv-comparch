#!/usr/bin/env python
# -*- coding: utf-8
#
#* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
# File Name : miss-rate.py
# Creation Date : 13-04-2012
# Last Modified : Sat 21 Apr 2012 08:48:44 PM EEST
# Created By : Greg Liras <gregliras@gmail.com>
#_._._._._._._._._._._._._._._._._._._._._.*/
import re
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
    ret = {}
    ret['l1_miss_rate']=sum(misses[:6])/float(sum(transactions[:2]))
    ret['l2_miss_rate']=sum(misses[6:])/float(transactions[2])
    return ret

def main():
    f = open("datafiles","r")
    for i,df in enumerate(f):
        print i+1,miss_ratio(df.strip())['l1_miss_rate']

if __name__=="__main__":
    main()

