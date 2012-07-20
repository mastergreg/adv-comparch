#!/usr/bin/env python
# -*- coding: utf-8
#
#* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
# File Name : speedup.py
# Creation Date : 21-07-2012
# Last Modified : Sat 21 Jul 2012 01:11:29 AM EEST
# Created By : Greg Liras <gregliras@gmail.com>
#_._._._._._._._._._._._._._._._._._._._._.*/
from sys import argv

def usage():
    print "speedup.py cycles.dat l1.dat l2.dat"

def main():
    if len(argv) < 4:
        usage()
        exit(1)
    else:
        f1 = open(argv[1])
        f2 = open(argv[2])
        f3 = open(argv[3])
        l1 = map(lambda x: x.split()[0], f1.readlines())
        l2 = map(lambda x: x.split()[0], f2.readlines())
        l3 = map(lambda x: x.split()[0], f3.readlines())
        for i in range(len(l1)):
            print l1[i], "&", l2[i], "&", l3[i], "&", float(l1[0])/float(l1[i]), "\\\\"
        f1.close()
        f2.close()
        f3.close()
        


if __name__=="__main__":
    main()

