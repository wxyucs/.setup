#!/usr/bin/env bash

_INITCPP_DIR=$(dirname $(readlink -f $0))

function initcpp() {
    PROJNAME=$1
    if [ -z "$PROJNAME" ]
    then
	echo "Usage: initcpp <projectname>"
        return
    fi

    PROJROOT=./$PROJNAME
    if [ -d "$PROJROOT" ]
    then
          echo "Failed: directory $PROJROOT exists"
          return
    fi

    PROJBUILD=./$PROJROOT/build
    mkdir $PROJROOT
    mkdir $PROJBUILD
    mkdir $PROJROOT/src

    cp $_INITCPP_DIR/main.cpp $PROJROOT/src/main.cpp
    cp $_INITCPP_DIR/CMakeLists.txt $PROJROOT/CMakeLists.txt
    sed -i "s/!PROJNAME!/$PROJNAME/" $PROJROOT/CMakeLists.txt

    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S $PROJROOT -B $PROJBUILD
    ln -s ./build/compile_commands.json $PROJROOT/compile_commands.json
}
