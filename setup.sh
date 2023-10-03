#!/bin/bash

sudo apt update -y

sudo apt install terminator -y
sudo apt install git -y
sudo apt install python3.10-venv -y
sudo apt install gcc -y
sudo apt install npm -y

sudo snap install nvim --classic

cd ~

git clone https://github.com/gwhitson/ubuntu-setup

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mv ~/ubuntu-setup/nvim ~/.config/nvim

#sudo cp /etc/sudoers ~/ubuntu-setup/.tempfile
#sudo chmod 777 ~/ubuntu-setup/.tempfile

#echo "Defaults:${USER} timestamp_timeout=240" >> ~/ubuntu-setup/.tempfile
#sudo chmod 440 ~/ubuntu-setup/.tempfile

#sudo mv ~/ubuntu-setup/.tempfile /etc/sudoers
#sudo chmod 440 /etc/sudoers

sudo rm /bin/editor
sudo ln -s /snap/nvim/current/usr/bin/nvim /bin/editor

echo "alias vi='nvim .'" >> ~/.bash_aliases
echo "alias vim='nvim .'" >> ~/.bash_aliases


rm -rf ~/ubuntu-setup
sudo apt upgrade -y
