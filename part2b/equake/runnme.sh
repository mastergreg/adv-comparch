#!/bin/sh
sed -i 's/l2c\.config_line_size =.*$/l2c\.config_line_size = '$2'/g' cache-hierarchy.simics
sed -i 's/l2c\.config_line_number =.*$/l2c\.config_line_number = '$3'/g' cache-hierarchy.simics

sed -i 's/outputfile = .*$/outputfile = ("equake-'$1'.'$2'")/g' equake.simics
../../simics-workspace/simics -stall -x equake.simics
