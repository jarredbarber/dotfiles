#!/bin/bash
sudo apt update
sudo apt install -y git zsh tmux tmuxinator stow 
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git config --global user.name 'Jarred Barber'
git config --global user.email 'jpb5082@gmail.com'



