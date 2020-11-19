#!/bin/sh

mkdir build
cd build
cmake ../../../simulator -DDEFINE_ENABLE_NETRACE=ON
make
cd ..
cp build/sim .
wget https://www.cs.utexas.edu/~netrace/download/netrace-1.0.tar.bz2
tar -xf netrace-1.0.tar.bz2
mv netrace-1.0/testraces/example.tra.bz2 config/
cp config/ntConfig.xml config/config.xml
./sim

#black sholes mode
wget https://www.cs.utexas.edu/~netrace/download/blackscholes_64c_simsmall.tra.bz2
mv config/ntConfig-blacksholes.xml config/ntConfig.xml
./sim
