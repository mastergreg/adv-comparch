#!/bin/bash
for f in $(find ../../src -iname "*.png")
do
    v=${f#../../}
    echo ${v//\//-}
    ln -s $f ${v//\//-}
done
