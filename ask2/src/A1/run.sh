#!/bin/bash
files=$1/*

for i in $files
do
    echo $i
    ./predict $i > $i.res
done
