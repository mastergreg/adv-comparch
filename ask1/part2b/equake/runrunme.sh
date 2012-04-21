#!/bin/sh
rm equake-*
./runnme.sh 512 64 8192
./runnme.sh 512 256 2048
./runnme.sh 1024 64 16384
./runnme.sh 1024 256 4096
./runnme.sh 2048 64 32768
./runnme.sh 2048 256 8192
./proc.sh equake
