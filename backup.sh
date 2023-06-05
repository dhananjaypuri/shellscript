#!/bin/bash

#### This script takes the backup of the folder and file ####

dt=$(date +%d%m%y%s)

if [[ ${UID} -eq 0 ]]
then
    echo "Welcome Root User"
    if ls *.txt > /dev/null
    then
        if tar cvfz ${dt}.tar.gz *.txt > /dev/null
        then
            echo "Backup taken successfully : File name ${dt}.tar.gz"
        else
            echo "Backup Failed"
        fi
        
    fi
else
    echo "Sorry Cannot execute the script"
fi
