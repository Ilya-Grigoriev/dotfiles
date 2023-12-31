#!/bin/sh
CODE_LANG=$( xset -q | grep LED | awk '{print substr ($10,5,1)}' )
if [ $CODE_LANG -eq 1 ]
then
    echo "[RU]"
else
    echo "[EN]"
fi
