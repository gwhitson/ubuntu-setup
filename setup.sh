#!/bin/bash
sudo apt update -y
sudo apt install git -y
sudo apt install python3.10-venv -y
sudo apt install gcc -y
#sudo apt install npm -y
sudo apt install imagemagick -y
sudo apt install python3-pip -y
sudo apt install tmux -y
sudo pip3 install pywal

sudo snap list | grep -q "nvim"
if [ $? -eq 1 ] ; then
    sudo snap install nvim --classic
fi

ls ~/.local/share | grep -q "ubuntu-setup"
if [ $? -eq 0 ] ; then
	rm -rf ~/.local/share/ubuntu-setup
fi
git clone https://github.com/gwhitson/ubuntu-setup ~/.local/share/ubuntu-setup

cp -r ~/.local/share/ubuntu-setup/wal ~/.cache/wal

ls ~/.config | grep -q "nvim"
if [ $? -eq 0 ] ; then
	rm -rf ~/.config/nvim
fi

cp -r ~/.local/share/ubuntu-setup/nvim ~/.config/nvim
ls ~/.config | grep -q "tmux"
if [ $? -eq 0 ] ; then
	rm -rf ~/.config/tmux
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp -r ~/.local/share/ubuntu-setup/tmux ~/.config/tmux
sudo rm /bin/editor
sudo ln -s /snap/nvim/current/usr/bin/nvim /bin/editor
touch ~/.bash_aliases
grep -q "alias vi='nvim'" ~/.bash_aliases 2>/dev/null
if [ $? -eq 1 ] ; then 
    echo "alias vi='nvim'" >> ~/.bash_aliases
fi

grep -q "alias vim='nvim'" ~/.bash_aliases 2>/dev/null
if [ $? -eq 1 ] ; then 
    echo "alias vim='nvim'" >> ~/.bash_aliases
fi
touch ~/.bashrc
grep -q "wal -R" ~/.bashrc 2>/dev/null
if [ $? -eq 1 ] ; then 
    echo "wal -R >/dev/null" >> ~/.bashrc
fi

ls ~/.ssh | grep -q ".pub"
if [ $? -eq 1 ] ; then
    ssh-keygen -t rsa -b 2048  -f ~/.ssh/git_key -N ""
else
    echo "ensure SSH key has been uploaded to github"
fi
#sudo apt upgrade -y
