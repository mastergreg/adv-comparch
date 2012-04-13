#!/usr/bin/env python
# -*- coding: utf-8
#
#* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
# File Name : miss-rate.py
# Creation Date : 13-04-2012
# Last Modified : Fri 13 Apr 2012 02:58:05 AM EEST
# Created By : Greg Liras <gregliras@gmail.com>
#_._._._._._._._._._._._._._._._._._._._._.*/
import re
def miss_ratio(fname):
    f = open(fname)
    r1 = re.compile("misses")
    r2 = re.compile("Total number of transactions")
    misses = 0
    transactions = 0
    for i in f:
        if re.search(r1,i):
            misses += int(i.split(":")[-1].strip())
        if re.search(r2,i):
            transactions +=  int(i.split(":")[-1].strip())
        if i.startswith("Cache statistics: l2c"):
            break
    return float(misses)/float(transactions)

def main():
    f = open("datafiles","r")
    for i,df in enumerate(f):
        print i,miss_ratio(df.strip())

if __name__=="__main__":
    main()

