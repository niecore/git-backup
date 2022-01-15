cmd=$1
repo_url=$2
config_folder=$3

if [[ $cmd == "backup" ]]; then
    backup
elif [[ $cmd == "restore" ]]; then
    restore
else
    echo "Usage: git-backup.sh backup|restore url folder"
fi

backup () {
    cd $config_folder

    if [[ $(git diff --stat) != '' ]]; then
        git add .
        git commit -m "Config files on `date +'%d-%m-%Y %H:%M:%S'`"
        git push -u origin master
    else
        echo 'nothing to backup'
    fi
}

restore () {
    git clone $repo_url $config_folder
}

