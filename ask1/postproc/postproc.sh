#!/bin/bash
folders=(art equake gzip mcf)
#cd art && ./proc.sh art && cd ../
for i in $(seq 0 1 3)
do
    curr=${folders[$i]}
    echo $curr
    cd $curr && ./proc.sh $curr && cd ../
done
