#!/bin/sh

# This is only run when building in order to make it easier to build without having to go into the oll dir

cd oll/build 
conan install ..
cd ..
make 
./build/oll
