#/bin/bash

if [[ ${UID} -eq 0 ]]
then
    echo "Welcome Root User"
    if apt update -y > /dev/null
    then
        echo "Updated"
    else
        echo "Update failed"
        exit 1
    fi
else
    echo "Sorry Cannot execute the script"
fi
