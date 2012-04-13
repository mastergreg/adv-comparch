#!/bin/bash
ls | grep $1- | sort -n --field-separator=- -k2 > datafiles
./ipc.py > ipc-$1
./miss-rate.py > miss-rate-$1 
#rm datafiles 
mv ipc-$1 ../
mv miss-rate-$1 ../
