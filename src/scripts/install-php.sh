#!/usr/bin/env bash

sudo apt update && sudo apt install -y software-properties-common
if [[ $OSD_ID == "ubuntu" ]]; then
    sudo add-apt-repository -yu ppa:ondrej/php
elif [[ $OSD_ID == "debian" ]]; then
    curl -fsSL https://packages.sury.org/php/apt.gpg | sudo apt-key add -
    sudo add-apt-repository "deb https://packages.sury.org/php/ $(lsb_release -cs) main"
else
    echo "OS not supported."
fi
sudo apt-get update
sudo apt-get install -y php"${ORB_VAL_VERSION}"
