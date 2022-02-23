#!/bin/bash

# collects username of user running script
USER=`whoami`

# updates apt cache and installs or updates zsh and git
sudo apt update && sudo apt install zsh git -y

# checks if user shell has been set to zsh yet
if [ $SHELL != "/bin/zsh" ];
then
   # if not set to zsh yet , changes user default to zsh
   sudo chsh -s /bin/zsh $USER
fi

# checks for an installation of oh-my-zsh
if [ ! -d "~/.oh-my-zsh"];
then
   # if oh-my-zsh directory doesn't exist, downloads from github and runs installation
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# changes dir back to home directory in case it changed
cd ~

# pulls custom zshrc configuration from github so it's configured already
curl -LJO https://raw.githubusercontent.com/TheJenious0917/linuxprofile/main/.zshrc

# starts zsh
zsh
