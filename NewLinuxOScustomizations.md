# New Ubuntu customizations

install git and zsh

    sudo apt update && sudo apt install zsh git -y
    
set zsh as default shell

    sudo chsh -s /bin/zsh username
    
install oh-my-zsh

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
config oh-my-zsh and zsh (use .zshrc file in repo)

install vscode - code.visualstudio.com/download

sign into github in VSCode to sync settings

install Edge browser

    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-beta.list'
    sudo rm microsoft.gpg
    sudo apt update
    sudo apt install microsoft-edge-beta
    
clean up fonts
    
    sudo apt-get remove "fonts-kacst*" "fonts-khmeros*" fonts-lklug-sinhala fonts-guru-extra "fonts-nanum*" fonts-noto-cjk "fonts-takao*" fonts-tibetan-machine fonts-lao fonts-sil-padauk fonts-sil-abyssinica "fonts-tlwg-*" "fonts-lohit-*" fonts-beng-extra fonts-gargi fonts-gubbi fonts-gujr-extra fonts-kalapi "fonts-samyak*" fonts-navilu fonts-nakula fonts-orya-extra fonts-pagul fonts-sarai "fonts-telu*" "fonts-wqy*" "fonts-smc*" fonts-deva-extra fonts-sahadeva
    sudo dpkg-reconfigure fontconfig
    
disable firewall logging

    sudo ufw logging off

If using another OS like debian or the cloudinit configuration in the related directory, some of this is unecessary
