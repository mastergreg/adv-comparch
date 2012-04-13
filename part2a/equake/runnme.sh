#!/bin/sh
sed -i 's/l2c\.config_assoc = .*$/l2c\.config_assoc = '$1'/g' cache-hierarchy.simics
sed -i 's/l2c\.config_lines =.*$/l2c\.config_lines = '$2'/g' cache-hierarchy.simics


sed -i 's/outputfile = .*$/outputfile = ("equake-'$1'.'$2'.'$3'.'$4'")/g' equake.simics
../../simics-workspace/simics -stall -x equake.simics
