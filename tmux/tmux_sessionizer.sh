#!/bin/bash

if [[ $TMUX == "" ]]; then
    TEST=`tmux ls 2>/dev/null`

    if [ $? -ne 1 ];
    then 
        TEST=$(echo $TEST | awk '{print $1}')
        tmux a -t $TEST
    else
        tmux
    fi
fi
