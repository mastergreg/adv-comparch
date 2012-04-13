#!/bin/sh
sed -i 's/ic\.config_line_number =.*$/ic\.config_line_number = '$1'/g' cache-hierarchy.simics
sed -i 's/ic\.config_assoc = .*$/ic\.config_assoc = '$2'/g' cache-hierarchy.simics
#sed -i 's/ic\.config_line_number =.*$/ic\.config_line_number = '$1'/g' cache-hierarchy.simics
#sed -i 's/ic\.config_lines =.*$/ic\.config_lines = '$1'/g' cache-hierarchy.simics

sed -i 's/dc\.config_line_number =.*$/dc\.config_line_number = '$1'/g' cache-hierarchy.simics
sed -i 's/dc\.config_assoc = .*$/dc\.config_assoc = '$2'/g' cache-hierarchy.simics
#sed -i 's/dc\.config_line_number =.*$/dc\.config_line_number = '$1'/g' cache-hierarchy.simics
#sed -i 's/dc\.config_lines =.*$/dc\.config_lines = '$1'/g' cache-hierarchy.simics

sed -i 's/outputfile = .*$/outputfile = ("mcf-'$1'.'$2'")/g' mcf.simics
../../simics-workspace/simics -stall -x mcf.simics
