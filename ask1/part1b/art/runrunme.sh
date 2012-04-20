#!/bin/sh
#rm art-*
#./runnme.sh 16 4 32 512
#./runnme.sh 16 4 128 128
#./runnme.sh 32 4 32 1024
#./runnme.sh 32 4 128 256
#./runnme.sh 32 8 32 1024
./runnme.sh 32 8 128 256
./runnme.sh 64 4 32 2048
./runnme.sh 64 4 128 512
./runnme.sh 64 8 32 2048
./runnme.sh 64 8 128 512
./proc.sh art
