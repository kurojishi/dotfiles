#!/bin/bash

# doing this afterwards as i'm copying preferences data
echo "Installing firefox from apt and not snap with appropriate priority"
sudo add-apt-repository ppa:mozillateam/ppa
sudo cp -rv ~/.etc_dir_files/apt/preferences.d /etc/apt/
sudo apt update
sudo apt install firefox
