#!/bin/bash

# all apps wanted
sudo apt update -y
sudo apt install git -y
sudo apt install python3.10-venv -y
sudo apt install gcc -y
sudo apt install imagemagick -y
sudo apt install python3-pip -y
sudo apt install tmux -y
sudo pip3 install pywal

# add all wanted aliases
touch ~/.bash_aliases
grep -q "alias vi='nvim'" ~/.bash_aliases 2>/dev/null
if [ $? -eq 1 ] ; then 
    echo "alias vi='nvim'" >> ~/.bash_aliases
fi

grep -q "alias clear_nvim_cache='rm ~/.local/state/nvim/swap/*.swp'" ~/.bash_aliases 2>/dev/null
if [ $? -eq 1 ] ; then 
    echo "alias clear_nvim_cache='rm ~/.local/state/nvim/swap/*.swp'" >> ~/.bash_aliases
fi

grep -q "alias vim='nvim'" ~/.bash_aliases 2>/dev/null
if [ $? -eq 1 ] ; then 
    echo "alias vim='nvim'" >> ~/.bash_aliases
fi

# tmux sessionizer v1
grep -q "bash ~/.config/tmux/tmux_sessionizer.sh" ~/.bashrc 2>/dev/null
if [ $? -eq 1 ] ; then 
    echo "bash ~/.config/tmux/tmux_sessionizer.sh" >> ~/.bashrc
fi

# verify/install neovim installed
sudo snap list | grep -q "nvim"
if [ $? -eq 1 ] ; then
    sudo snap install nvim --classic
fi

# fetch (new) copy of ubuntu-setup git repo
ls ~/.local/share | grep -q "ubuntu-setup"
if [ $? -eq 0 ] ; then
	rm -rf ~/.local/share/ubuntu-setup
fi
git clone https://github.com/gwhitson/ubuntu-setup ~/.local/share/ubuntu-setup

cp -r ~/.local/share/ubuntu-setup/wal ~/.cache/wal

# relink neovim config file to newly fetched copy
ls ~/.config | grep -q "nvim"
if [ $? -eq 0 ] ; then
	rm -rf ~/.config/nvim
fi
ln -s ~/.local/share/ubuntu-setup/nvim ~/.config/nvim

# get everything for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ls ~/.config | grep -q "tmux"
if [ $? -eq 0 ] ; then
	rm -rf ~/.config/tmux
fi
ln -s ~/.local/share/ubuntu-setup/tmux ~/.config/tmux


# link neovim as editor
sudo rm /bin/editor
sudo ln -s /snap/nvim/current/usr/bin/nvim /bin/editor

touch ~/.bashrc
grep -q "wal -R" ~/.bashrc 2>/dev/null
if [ $? -eq 1 ] ; then 
    echo "wal -R >/dev/null" >> ~/.bashrc
fi


sudo apt upgrade -y
