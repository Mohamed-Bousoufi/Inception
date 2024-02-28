#!/bin/bash

if [ ! -d /home/mbousouf/data ];then
    mkdir -p /home/mbousouf/data/filesdata
    mkdir -p /home/mbousouf/data/mariadb
    echo "create directories ...."
else 
    echo "directories already exists!!!"
fi

