#!/bin/bash

if [[ ${UID} -eq 0 ]]
then
    echo "Welcome Root"
    for ip in `cat ip.txt`
    do
        echo "Executing Commands in ${ip}"
        ssh -o StrictHostKeyChecking=no root@${ip} 'bash -s'  < commands.sh
        echo "==============================="
    done
else
    echo "Sorry User must be root to execute this script !!!!! "
fi
