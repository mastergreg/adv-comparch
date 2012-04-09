#!/bin/sh
sed -i 's/l2c\.config_assoc = .*$/l2c\.config_assoc = '$1'/g' cache-hierarchy.simics
sed -i 's/l2c\.config_lines =.*$/l2c\.config_lines = '$2'/g' cache-hierarchy.simics

sed -i 's/outputfile = .*$/outputfile = ("gzip-'$1'.'$2'.'$3'.'$4'")/g' gzip.simics
../../simics-workspace/simics -stall -x gzip.simics
