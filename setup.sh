#!/bin/bash

#### Function to install package ####
function install_pkg {
    pkgName=${1}
    echo "Installing ${pkgName}";
    if apt install ${pkgName} -y > /dev/null
    then
        echo "${pkgName} installed Successfully"
        
    else
        echo "${pkgName} Failed to install Successfully"
        exit 1
    fi
}

#### Function to check if target folder is present ####
function check_target_folder {
    if [[ -d target/ ]]
    then
        echo "Deleting target directory as its already present !!!!! "
        rm -rf target > /dev/null 
    fi
}

#### Function to Run mvn commands ####

function execute_mvn_command {
    command=${1}
    echo "Executing mvn ${command}"
    if mvn ${command} > /dev/null
    then
        echo "Test Completed Successfully !!!!!"
    else
        echo "Test failed !!!!!"
        exit 1
    fi
}

#### Function to Copy artifact  ####

function copy_artifact {
    if cp -rvf target/hello-world-0.0.1-SNAPSHOT.war /var/lib/tomcat9/webapps/app.war
    then
        echo "Artifact Copied successfully !!!! "
        echo "Try accessing app at http://54.160.255.232:8080/app"
    else
        echo "Error Artifact cannot be copied !!!!"
    fi
}

## Check if the user is root user ####

if [[ ${UID} -eq 0 ]]
then
    echo "############ Welcome Root ############"
    if ping -c 1 8.8.8.8 > /dev/null
    then
        echo "Internet is working"
        apt update -y > /dev/null
        check_target_folder
        install_pkg maven
        execute_mvn_command test
        execute_mvn_command package
        install_pkg tomcat9
        copy_artifact
    else
        echo "Internet is not working"
    fi
else
    echo "Sorry only root user is allowed to run the script"
fi
