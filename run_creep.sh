#!/bin/bash
set -e
minute=`date | cut -d " " -f 5 | cut -c 4,5`

PLAYCOMMAND=aplay
while true
do
    newminute=`date | cut -d " " -f 5 | cut -c 4,5`
    if [ $newminute -gt $minute ]
    then
        minute=$newminute
        pico2wave -l en-GB -w phrase.wav "`./phrase.py`"
        $PLAYCOMMAND chime.wav
        $PLAYCOMMAND phrase.wav
        sleep 0.5
        $PLAYCOMMAND phrase.wav
    else
        digit=`echo $RANDOM | cut -c 3`
        delay=`echo $RANDOM | cut -c 3`
        $PLAYCOMMAND $digit.wav
        sleep 0.$delay
    fi
done
