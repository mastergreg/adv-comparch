#!/bin/sh
sed -i 's/l2c\.config_assoc = .*$/l2c\.config_assoc = '$1'/g' cache-hierarchy.simics
sed -i 's/l2c\.config_line_number =.*$/l2c\.config_line_number = '$2'/g' cache-hierarchy.simics


sed -i 's/outputfile = .*$/outputfile = ("art-'$1'.'$2'")/g' art.simics
../../../simics-workspace/simics -stall -x art.simics
