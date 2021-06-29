#!/bin/bash

# File description: simple example of cmake usage

function compile_sh {
    #gcc -Wall -Wextra -Werror -c main.cpp -o main.o
    gcc -c adder.cpp -o adder.o
    gcc -c main.cpp -o main.o
    gcc main.o adder.o -lstdc++ -o main
    echo " "
    echo " "
    echo "./main"
    ./main
}

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
    rm -rf main
    rm -rf *.o
    rm -rf build
    rm -rf CMakeCache.txt
    rm -rf CMakeFiles
    rm -rf cmake_install.cmake
}

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -ldd   : print shared object dependencies default"
    echo " -c     : compile"
    echo " -cmake : use the cmake for compilation (generation of Makefile)"
    echo " -clean : clean"
    echo " -h     : print help"
}

if [ $# -eq 0 ]; then
    printHelp
else
    if [ "$1" = "-ldd" ]; then
        ldd main
    elif [ "$1" = "-c" ]; then
	compile_sh
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
