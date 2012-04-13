#!/bin/sh
sed -i 's/ic\.config_line_number =.*$/ic\.config_line_number = '$1'/g' cache-hierarchy.simics
sed -i 's/ic\.config_assoc = .*$/ic\.config_assoc = '$2'/g' cache-hierarchy.simics

sed -i 's/dc\.config_line_number =.*$/dc\.config_line_number = '$1'/g' cache-hierarchy.simics
sed -i 's/dc\.config_assoc = .*$/dc\.config_assoc = '$2'/g' cache-hierarchy.simics
sed -i 's/outputfile = .*$/outputfile = ("art-'$1'.'$2'")/g' art.simics
../../simics-workspace/simics -stall -x art.simics
