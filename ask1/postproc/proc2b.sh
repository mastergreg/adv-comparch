#!/bin/bash
if [ 'x'$1 == 'x' ];
then
    echo "No input given"
    exit 1
fi
if [ -a 'datafiles1' ];
then
    echo "file exists, using that"
else
    ls | grep $1- | grep 256 | sort -n --field-separator=. -k4 > datafiles1
fi
if [ -a 'datafiles2' ];
then
    echo "file exists, using that"
else
    ls | grep $1- | grep -v 256 | sort -n --field-separator=. -k4 > datafiles2
fi

cp datafiles1 datafiles
cat datafiles
./ipc.py > ../64/ipc-$1
./miss-rate.py > ../64/miss-rate-$1

cp datafiles2 datafiles
cat datafiles
./ipc.py > ../256/ipc-$1
./miss-rate.py > ../256/miss-rate-$1 
