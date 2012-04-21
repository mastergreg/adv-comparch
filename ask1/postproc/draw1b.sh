#!/bin/bash
cd 32
./gplot-ipc ipc-*
./gplot-missrate miss-rate-*
cd ../
cd 128
./gplot-ipc ipc-*
./gplot-missrate miss-rate-*
cd ../

