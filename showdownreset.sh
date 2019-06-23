#!/bin/bash

if pidof -o %PPID -x "$0"; then
   exit 1
fi

while true; do
    sleep 5
    SYSTEMTIME=`date "+%s"`
    SHOWDOWNTIME=`date -d "$(tail -n 1 /home/showdown/ShowDown.log | awk '{print $2}' | awk -F "," '{print $1}')" "+%s"`

    echo "showdown time : $SHOWDOWNTIME"
    echo "system time : $SYSTEMTIME"

    if [ `expr $SHOWDOWNTIME + 600` -le $SYSTEMTIME ]; then
        /usr/local/bin/showdownreset
        echo "showdownreset excuted..."
    fi
done


exit 0

