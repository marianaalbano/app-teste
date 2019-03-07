#!/bin/bash

SCRIPTS=$(ls ../scripts | wc -l)
CRONTAB=$(grep -cve '^\s*$' ../config/crontab | wc -l)


if [ $SCRIPTS -eq $CRONTAB ]
then
    echo "OK"
    exit 0
else
    echo "DEU RUIM"
    exit 1
fi
