#!/bin/bash
if [ 'x'$1 == 'x' ]
then
    pattern="*.c"
else
    pattern=$1
fi
for f in $(find ../../ -iname $pattern)
do
    v=${f#../../}
    echo ${v//\//-}
    ln -sf $f ${v//\//-}
done
