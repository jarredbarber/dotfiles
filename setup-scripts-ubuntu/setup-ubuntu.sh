#!/bin/bash
sudo apt update
sudo apt install -y git zsh tmux tmuxinator stow 
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

