#!/bin/bash

sudo apt update -y

sudo apt install git -y
sudo apt install python3.10-venv -y

sudo snap list | grep -q "nvim"
if [ $? -eq 1 ] ; then
    sudo snap install nvim --classic
fi

ls ~/.local/share | grep -q "ubuntu-setup"
if [ $? -eq 0 ] ; then
	rm -rf ~/.local/share/ubuntu-setup
fi
git clone https://github.com/gwhitson/ubuntu-setup ~/.local/share/ubuntu-setup

ls ~/.local/share/nvim/site/pack | grep -q "packer"
if [ $? -eq 1 ] ; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi


ls ~/.config | grep -q "nvim"
if [ $? -eq 0 ] ; then
	rm -rf ~/.config/nvim
fi
ln -s ~/.local/share/ubuntu-setup/nvim ~/.config/nvim

#sudo rm /bin/editor
#sudo ln -s /snap/nvim/current/usr/bin/nvim /bin/editor

grep -q ~/.bash_aliases "alias vi='nvim'" 2>/dev/null
if [ $? -eq 1 ] ; then 
    echo "alias vi='nvim'" >> ~/.bash_aliases
fi

grep -q ~/.bash_aliases "alias vim='nvim'" 2>/dev/null
if [ $? -eq 1 ] ; then 
    echo "alias vim='nvim'" >> ~/.bash_aliases
fi


#ls ~/.ssh | grep -q ".pub"
#if [ $? -eq 1 ] ; then
#    ssh-keygen -t rsa -b 2048  -f ~/.ssh/git_key -N ""
#else
#    echo "ensure SSH key has been uploaded to github"
#fi

sudo apt upgrade -y
