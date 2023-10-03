#!/bin/bash

sudo apt upgrade -y
sudo apt update -y

sudo apt install terminator -y
sudo apt install git -y
sudo apt install python3.10-venv -y
sudo apt install gcc -y

sudo snap install nvim --classic

cd ~

git clone https://github.com/gwhitson/ubuntu-setup

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mv ~/ubuntu-setup/nvim ~/.config/nvim

sudo cp /etc/sudoers ~/ubuntu-setup/.tempfile
sudo chmod 777 ~/ubuntu-setup/.tempfile

echo "Defaults:${USER} timestamp_timeout 240" >> ~/ubuntu-setup/.tempfile
sudo chmod 440 ~/ubuntu-setup/.tempfile

sudo mv ~/ubuntu-setup/.tempfile /etc/sudoers
sudo chmod 440 /etc/sudoers


rm -rf ~/ubuntu-setup
