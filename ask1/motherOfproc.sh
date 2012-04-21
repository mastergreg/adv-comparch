#!/bin/bash
folders=(part1a part1b part2a part2b)
#cd art && ./proc.sh art && cd ../
for i in $(seq 0 1 3)
do
    curr=${folders[$i]}
    echo $curr
    cd $curr && ./postproc.sh && cd ../
done
