#!/bin/sh
sed -i 's/ic\.config_assoc = .*$/ic\.config_assoc = '$2'/g' cache-hierarchy.simics
sed -i 's/ic\.config_line_size =.*$/ic\.config_line_size = '$3'/g' cache-hierarchy.simics
sed -i 's/ic\.config_line_number =.*$/ic\.config_line_number = '$4'/g' cache-hierarchy.simics

sed -i 's/dc\.config_assoc = .*$/dc\.config_assoc = '$2'/g' cache-hierarchy.simics
sed -i 's/dc\.config_line_size =.*$/dc\.config_line_size = '$3'/g' cache-hierarchy.simics
sed -i 's/dc\.config_line_number =.*$/dc\.config_line_number = '$4'/g' cache-hierarchy.simics

sed -i 's/ts_i\.next_cache_line_size =.*$/ts_i\.next_cache_line_size = '$3'/g' cache-hierarchy.simics
sed -i 's/ts_d\.next_cache_line_size =.*$/ts_d\.next_cache_line_size = '$3'/g' cache-hierarchy.simics

sed -i 's/outputfile = .*$/outputfile = ("equake-'$1'.'$2'.'$3'.'$4'")/g' equake.simics
../../../simics-workspace/simics -stall -x equake.simics
