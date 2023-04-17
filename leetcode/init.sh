#!/usr/bin/env bash

_LEETCODE_DIR=$(dirname $(readlink -f $0))

function leetcode() {
    NUM=$1
    NAME=$2
    if [ -z "$NUM" ]
    then
          echo "NUMBER is empty, usage: leetcode <NUMBER> <NAME>"
          return
    fi
    if [ -z "$NAME" ]
    then
          echo "NAME is empty, usage: leetcode <NUMBER> <NAME>"
          return
    fi

    NAME=`echo $NAME | tr ' ' '-' | tr '[:upper:]' '[:lower:]'`

    PROBLEMROOT=$HOME/leetcode/${NUM}_${NAME}
    if [ -d "$PROBLEMROOT" ]
    then
          echo "path $PROBLEMROOT exists"
          return
    fi

    mkdir -p $PROBLEMROOT

    cp $_LEETCODE_DIR/main.cpp $PROBLEMROOT/main.cpp
    cp $_LEETCODE_DIR/makefile $PROBLEMROOT/makefile
    cp $_LEETCODE_DIR/README $PROBLEMROOT/README
    sed -i "s/!NAME!/$NAME/" $PROBLEMROOT/makefile
    sed -i "s/!NAME!/$NAME/" $PROBLEMROOT/README

    cd $PROBLEMROOT
    emacs -nw main.cpp
}
