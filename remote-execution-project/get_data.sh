#!/bin/bash
sudo -s
os_name=$(sudo cat /etc/os-release | grep -i PRETTY_NAME | awk -F= '{print $2}' | sed 's/"//g')
root_available=$(df -h | grep /$ | awk '{print $4}' | sed 's/G//g' | awk -F. '{print $1}')
space_message=""
if [ ${root_available} -ge 5 ]
then
    space_message="Volume health is good"
else
    space_message="Warning : Please increase volume size !!!!"
fi
ports_opened=$(netstat -4nltp | grep -v -e "^Active" -e "^Proto" | awk '{print $4}' | awk -F: '{print $NF}')
echo -e "OS_NAME = ${os_name}\nAvailable Root (In GB) = ${root_available} (${space_message})\nOpened Ports\n${ports_opened}"
echo "=================================="
