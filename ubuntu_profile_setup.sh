#!/bin/bash
# configures the primary user profile on an ubuntu based linux desktop server

# collects username of user running script
USER=`whoami`

# updates apt cache and installs or updates zsh and git
sudo apt update && sudo apt install zsh git -y

# checks if user shell has been set to zsh yet
if [ $SHELL != "/bin/zsh" ];
then
   # if not set to zsh yet , changes user default to zsh
   sudo -s chsh -s /bin/zsh $USER
fi

# checks for an installation of oh-my-zsh
if [ ! -d "~/.oh-my-zsh" ];
then
   # if oh-my-zsh directory doesn't exist, downloads from github and runs installation
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# changes dir back to home directory in case it changed
cd ~

# pulls custom zshrc configuration from github so it's configured already
curl -LJO https://raw.githubusercontent.com/TheJenious0917/linuxprofile/main/.zshrc

# installs vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https -y
sudo apt update
sudo apt install code -y

# installs MS Edge beta
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-beta.list'
sudo rm microsoft.gpg
sudo apt update
sudo apt install microsoft-edge-beta -y

# clean up fonts
sudo apt remove "fonts-kacst*" "fonts-khmeros*" fonts-lklug-sinhala fonts-guru-extra "fonts-nanum*" fonts-noto-cjk "fonts-takao*" \
fonts-tibetan-machine fonts-lao fonts-sil-padauk fonts-sil-abyssinica "fonts-tlwg-*" "fonts-lohit-*" fonts-beng-extra fonts-gargi \
fonts-gubbi fonts-gujr-extra fonts-kalapi "fonts-samyak*" fonts-navilu fonts-nakula fonts-orya-extra fonts-pagul fonts-sarai \
"fonts-telu*" "fonts-wqy*" "fonts-smc*" fonts-deva-extra fonts-sahadeva -y
sudo dpkg-reconfigure fontconfig

# disable local linux firewall logging
sudo ufw logging off

