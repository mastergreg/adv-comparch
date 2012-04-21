#!/bin/bash
cd 64
./gplot-ipc ipc-*
./gplot-missrate miss-rate-*
cd ../
cd 256
./gplot-ipc ipc-*
./gplot-missrate miss-rate-*
cd ../

