#!/bin/sh
sed -i 's/l2c\.config_line_size =.*$/l2c\.config_line_size = '$2'/g' cache-hierarchy.simics
sed -i 's/l2c\.config_line_number =.*$/l2c\.config_line_number = '$3'/g' cache-hierarchy.simics

sed -i 's/outputfile = .*$/outputfile = ("mcf-'$1'.'$2'")/g' mcf.simics
../../../simics-workspace/simics -stall -x mcf.simics
