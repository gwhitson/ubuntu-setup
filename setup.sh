#!/bin/bash

sudo apt upgrade -y
sudo apt update -y

sudo apt install terminator -y
sudo apt install git -y
sudo apt install python3.10-venv -y

sudo snap install nvim --classic

cd ~

git clone https://github.com/gwhitson/ubuntu-setup

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

cd ubuntu-setup
mv ./nvim ~/.config/nvim
