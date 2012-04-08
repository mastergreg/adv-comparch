#!/bin/sh
sed -i 's/ic\.config_line_size =.*$/ic\.config_line_size = '$1'/g' cache-hierarchy.simics
sed -i 's/ic\.config_assoc = .*$/ic\.config_assoc = '$2'/g' cache-hierarchy.simics
sed -i 's/ic\.config_line_size =.*$/ic\.config_line_size = '$3'/g' cache-hierarchy.simics
sed -i 's/ic\.config_lines =.*$/ic\.config_lines = '$4'/g' cache-hierarchy.simics

sed -i 's/dc\.config_line_size =.*$/dc\.config_line_size = '$1'/g' cache-hierarchy.simics
sed -i 's/dc\.config_assoc = .*$/dc\.config_assoc = '$2'/g' cache-hierarchy.simics
sed -i 's/dc\.config_line_size =.*$/dc\.config_line_size = '$3'/g' cache-hierarchy.simics
sed -i 's/dc\.config_lines =.*$/dc\.config_lines = '$4'/g' cache-hierarchy.simics

sed -i 's/outputfile = .*$/outputfile = ("mcf-'$1'.'$2'.'$3'.'$4'")/g' mcf.simics
../../simics-workspace/simics -stall -x mcf.simics
