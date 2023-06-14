#!/bin/bash

function check_inventory {
    if [[ -f ip.txt ]]
    then
        echo "File is present"
    for srv in `cat ip.txt`
    do
        ip=$(echo ${srv} | awk -F: '{print $1}')
        remote_user=$(echo ${srv} | awk -F: '{print $2}')
        echo -e "\tExecuting script on : ${ip}"
        ssh -o StrictHostKeyChecking=no ${remote_user}@${ip} -i newkey.pem 'bash -s' < get_data.sh

    done

    else
        echo "Cannot find inventory file .."
        exit 1
    fi
}

if [[ ${UID} == 0 ]]
then
    echo "####### Executing Script ########"
    check_inventory

else
    echo "Script can only be executed as root"
    exit 1
fi
