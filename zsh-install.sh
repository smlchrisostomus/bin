#!/bin/bash

sudo apt update -y &&
sudo apt upgrade -y &&
sudo apt install zsh -y &&
sudo apt install powerline fonts-powerline -y &&
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

chsh -s $(which zsh)
