#Invoke as follows: simics -stall -x runbenchmark.simics
#Load checkpoint taken after the first breakpoint of the application
read-configuration /home/indoril/simics-workspace/checkpoints/benchloaded.check
#We disable breakpoints
disable-magic-breakpoint
instruction-fetch-mode instruction-fetch-trace
istc-disable
dstc-disable
#We do not need to mount host and copy benchmarks to root folder. They are already
#copied to the checkpoint we saved.
#Here is the point right after the first breakpoint.

#Run the wanted benchmark
con0.input "./gzip input.combined 32 \n"
#con0.input "./mcf ./inp.in.mcf.train \n"
#con0.input "./art -scanfile c756hel.in -trainfile1 a10.img -trainfile2 hc.img -stride 2 -startx 110 -starty 200 -endx 160 -endy 240 -objects 10 \n"
#con0.input "./equake < inp.in.equake.train \n"


#Load cache hierarcy parameters
echo "Loading caches"
run-command-file /home/indoril/simics-workspace/scripts/cache-hierarchy.simics
#Continue simulation for 100,000,000 instructions to warm-up caches
echo "Warming up caches"
c 100_000_000
$outputfile = ("RESULTS/gzip-64.4")
output-file-start $outputfile
#Reset statistics
dc.reset-statistics
ic.reset-statistics
l2c.reset-statistics
ptime
#Continue simulation for 1,000,000,000 instructions
echo "Simulating..."
c 1_000_000_000
#Collect statistics
dc.statistics
ic.statistics
l2c.statistics
ptime
output-file-stop $outputfile
exit
