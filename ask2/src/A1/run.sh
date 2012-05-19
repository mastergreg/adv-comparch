#!/bin/bash
files=tests/*

for i in $files
do
    echo $i
    ./predict $i > $i.res
done
