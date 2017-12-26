#!/bin/bash
echo "Pulling down miner"
git clone https://github.com/tpruvot/ccminer.git
cd ccminer
git checkout cuda-9

echo "Checking for CUDA and installing."
# Check for CUDA and try to install.
if ! dpkg-query -W cuda-9-1; then
  # The 16.04 installer works with 16.10.
  curl -O http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.1.85-1_amd64.deb
  dpkg -i ./cuda-repo-ubuntu1604_9.1.85-1_amd64.deb
  apt-get update
  apt-get install cuda-9-1 -y
fi

# Enable persistence mode
nvidia-smi -pm 1

apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential gcc-5 g++-5

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 1

sh build.sh

./ccminer --version

#./ccminer -a lyra2v2 -o stratum+tcp://pool.datapaw.net:4533 -u Scm8pHvkLLH2rweorEdxf8fECjbAuUhNb5 -p c=STAK
