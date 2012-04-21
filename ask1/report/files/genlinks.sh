#!/bin/bash
folders=(part1a part1b part2a part2b)

for i in $(seq 0 1 3)
do
    for f in $(find ../../${folders[$i]} -iname "*.png")
    do
        v=${f#../../}
        echo ${v//\//-}
        ln -s $f ${v//\//-}
    done
done
