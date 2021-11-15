#!/bin/bash
set -x 
echo "Preparing  deploy based on versions "
# version=="[0-9]{4}" # versions such as 2020,1920 numbered folders
echo "Read release txt"
input="release-file.txt"
echo "Conditionalize version based on the dir name included in the file name"
releasedir="ansible/RELEASE"
# create release folder in ansible directory
mkdir -p $releasedir
while IFS= read -r LINE
# check if the RELEASE folder exists
do
    # use regex to find what version the file belongs to
    version="$(echo "$LINE" | grep -o -P "(\ *[0-9]{4}+)")"
    echo " Version currently processing is $version "
    # extract file name 
    filename="$(basename $LINE)"
    echo " File currently processing is $filename "
    case $version in 
        '1520')
            echo "Create release folder for $version in $releasedir"
            mkdir -p $releasedir/$version
            # copy file/s to its release location
            cp "./$LINE" $releasedir/$version
            echo "File copied now Deploying to release location to  host at 1520"
            if [ -s "./$releasedir/$version/$filename" ]; then
                echo "File exists and is not empty, run playbook for $version"
                ansible-playbook -i hosts ansible/task.yml -l go.1520 -f=1
            else
                echo "File doesn't exit or is empty exiting"
            fi
            ;;
        '1620')
            echo "Create release folder for $version in $releasedir"
            mkdir -p $releasedir/$version
            # copy file/s to its release location
            cp "./$LINE" $releasedir/$version
            echo "File copied now Deploying to release location to  host at 1620"
            if [ -s "./$releasedir/$version/$filename" ]; then
                echo "File exists and is not empty, run playbook for $version"
                ansible-playbook -i hosts ansible/task.yml -l go.1620 -f=1
            else
                echo "File doesn't exit or is empty exiting"
            fi
            ;;
        '1720')
            echo "Create release folder for $version in $releasedir"
            mkdir -p $releasedir/$version
            # copy file/s to its release location
            cp "./$LINE" $releasedir/$version
            echo "File copied now Deploying to release location to  host at 1720"
            if [ -s "./$releasedir/$version/$filename" ]; then
                echo "File exists and is not empty, run playbook for $version"
                ansible-playbook -i hosts ansible/task.yml -l go.1720 -f=1
            else
                echo "File doesn't exit or is empty exiting"
            fi
            ;;
        '1820')
            echo "Create release folder for $version in $releasedir"
            mkdir -p $releasedir/$version
            # copy file/s to its release location
            cp "./$LINE" $releasedir/$version
            echo "File copied now Deploying to release location to  host at 1820"
            if [-s "./$releasedir/$version/$filename" ]; then
                echo "File exists and is not empty, run playbook for $version"
                ansible-playbook -i hosts ansible/task.yml -l go.1820 -f=1
            else
                echo "File doesn't exit or is empty exiting"
            fi
            ;;
        '1920')
            echo "Create release folder for $version in $releasedir"
            mkdir -p $releasedir/$version
            # copy file/s to its release location
            cp "./$LINE" $releasedir/$version
            echo "File copied now Deploying to release location to  host at 1920"
            if [ -s "./$releasedir/$version/$filename" ]; then
                echo "File exists and is not empty, run playbook for $version"
                ansible-playbook -i hosts ansible/task.yml -l go.1920 -f=1
            else
                echo "File doesn't exit or is empty exiting"
            fi
            ;;
        '2020')
            echo "Create release folder for $version in $releasedir"
            mkdir -p $releasedir/$version
            # copy file/s to its release location
            cp "./$LINE" $releasedir/$version
            echo "File copied now Deploying to release location to  host at 2020"
            if [ -s "./$releasedir/$version/$filename" ]; then
                echo "File exists and is not empty, run playbook for $version"
                ansible-playbook -i hosts ansible/task.yml -l go.2020 -f=1
            else
                echo "File doesn't exit or is empty exiting"
            fi
            ;;      
        *)
            echo -n "Provided host name not in host list $version please check"
            ;;
    esac

done < "$input"

# test="1520/rsl/test-rsl1.rsl"
# if [[ $test =~ (X[0-9]{4})$ ]]; then 
# echo "matche part is ${BASH_REMATCH[1]} "
# fi

# echo "$test" | grep -o -P "(\ *[0-9]{4}+)"

# loop through the files 

# 
