#!/bin/sh
sed -i 's/ic\.config_line_size =.*$/ic\.config_line_size = '$1'/g' cache-hierarchy.simics
sed -i 's/ic\.config_assoc = .*$/ic\.config_assoc = '$2'/g' cache-hierarchy.simics
#sed -i 's/ic\.config_line_size =.*$/ic\.config_line_size = '$1'/g' cache-hierarchy.simics
#sed -i 's/ic\.config_lines =.*$/ic\.config_lines = '$1'/g' cache-hierarchy.simics

sed -i 's/dc\.config_line_size =.*$/dc\.config_line_size = '$1'/g' cache-hierarchy.simics
sed -i 's/dc\.config_assoc = .*$/dc\.config_assoc = '$2'/g' cache-hierarchy.simics
#sed -i 's/dc\.config_line_size =.*$/dc\.config_line_size = '$1'/g' cache-hierarchy.simics
#sed -i 's/dc\.config_lines =.*$/dc\.config_lines = '$1'/g' cache-hierarchy.simics

sed -i 's/outputfile = .*$/outputfile = ("equake-'$1'.'$2'")/g' equake.simics
../../simics-workspace/simics -stall -x equake.simics
