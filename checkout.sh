#!/bin/bash
echo "Pulling down miner"
git clone https://github.com/tpruvot/ccminer.git
cd ccminer
git checkout cuda-9
