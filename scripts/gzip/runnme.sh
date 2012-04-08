#!/bin/sh
sed 's/config_line_size = 64/config_line_size = '$1'/g' cache-hierarchy_old.simics > cache-hierarchy_buf.simics
sed 's/config_assoc = 4/config_assoc = '$2'/g' cache-hierarchy_buf.simics > cache-hierarchy.simics
sed -i 's/outputfile = .*$/outputfile = ("gzip-'$1'.'$2'")/g' gzip.simics
../../simics-workspace/simics -stall -x gzip.simics
