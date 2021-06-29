#!/bin/bash

# File description: simple example of cmake usage

function cmake_sh {
    mkdir -p build
    cd build
    cmake ../
    cd ../
    make -C build
    echo " "
    echo " "
    echo "./build/main"
    ./build/main
}

function clean_sh {
    rm -rf *~
    rm -rf build
}

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -ldd   : print shared object dependencies default"
    echo " -cmake : use the cmake for compilation (generation of Makefile)"
    echo " -clean : clean"
    echo " -h     : print help"
}

if [ $# -eq 0 ]; then
    printHelp
else
    if [ "$1" = "-ldd" ]; then
        ldd ./build/main
    elif [ "$1" = "-cmake" ]; then
	cmake_sh
    elif [ "$1" = "-clean" ]; then
	clean_sh
    elif [ "$1" = "-h" ]; then
	printHelp
    else
        printHelp
    fi
fi
