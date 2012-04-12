#!/bin/bash
ls | grep $1- | sort -n --field-separator=- -k2 > datafiles
./proc.py > ipc-$1
cp ipc-$1 ../
