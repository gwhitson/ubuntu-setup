#!/bin/bash

sudo apt update -y

sudo apt install terminator -y
sudo apt install git -y
sudo apt install python3.10-venv -y
sudo apt install gcc -y
sudo apt install npm -y

sudo snap install nvim --classic

git clone https://github.com/gwhitson/ubuntu-setup

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mv ~/ubuntu-setup/nvim ~/.config/nvim

sudo rm /bin/editor
sudo ln -s /snap/nvim/current/usr/bin/nvim /bin/editor

echo "alias vi='nvim .'" >> ~/.bash_aliases
echo "alias vim='nvim .'" >> ~/.bash_aliases

ssh-keygen -t rsa -b 2048  -f ~/.ssh/git_key -N ""

rm -rf ~/ubuntu-setup
sudo apt upgrade -y

echo "Add the following key to github to use ssh"
cat ~/.ssh/git_key.pub

rm ~/Downloads/setup.sh
