#!/bin/bash
if [ 'x'$1 == 'x' ];
then
    echo "No input given"
    exit 1
fi
if [ -a 'datafiles' ];
then
    cat datafiles
else
    ls | grep $1- | sort -n --field-separator=- -k2 > datafiles
    cat datafiles
fi
./ipc.py > ipc-$1
./miss-rate.py > miss-rate-$1 
#rm datafiles 
mv ipc-$1 ../
mv miss-rate-$1 ../
