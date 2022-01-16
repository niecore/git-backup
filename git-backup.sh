#!/bin/bash

cmd=$1
repo_url=$2
config_folder=$3

backup () {
    cd $config_folder

    if [ -z "$(git status --porcelain)" ]; then 
        echo 'nothing to backup'
    else
        git add .
        git commit -m "Config files on `date +'%d-%m-%Y %H:%M:%S'`"
        git push -u origin master   
    fi
}

restore () {
    git clone $repo_url $config_folder
}

if [[ $cmd ==  "backup" ]]; then
    backup
elif [[ $cmd == "restore" ]]; then
    restore
else
    echo "Usage: git-backup.sh backup|restore url folder"
fi
