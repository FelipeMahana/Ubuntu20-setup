#!/bin/bash

#links
#https://askubuntu.com/questions/425754/how-do-i-run-a-sudo-command-inside-a-script#comment552406_425990
#https://askubuntu.com/questions/140246/how-do-i-resolve-unmet-dependencies-after-adding-a-ppa
#https://askubuntu.com/questions/992448/how-to-execute-a-bash-script-from-github
#https://stackoverflow.com/questions/47009776/how-to-run-nvm-in-oh-my-zsh

# SCRIPT INSTALACIÓN PARA UBUNTU 20.04

cd ~
sudo apt update -y

# Instalación de utilidades y programas

sudo apt install wget curl git gnome-tweak-tool gnome-shell-extensions \
p7zip-full p7zip-rar zsh git-core fonts-powerline audacity vlc gimp \
obs-studio steam synaptic xclip dconf-editor build-essential -y

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
# Instalación Spotify
sudo apt update && sudo apt install spotify-client -y

# Discord
# dependencia de Discord
sudo apt install libgconf-2-4 libappindicator1 libc++1 libc++1-10 libc++abi1-10 libatomic1 -y
cd ~/Downloads
# Instalación Discord
wget -O discord-0.0.1.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord-0.0.1.deb
rm -f discord-0.0.1.deb
cd ~

# Instalación zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" "" --unattended
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
# Instalación nvm
# necesario para script de develop
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
# agregar nvm a plugins
sed -i 's/plugins=(git)/plugins=(git nvm)/g' ~/.zshrc

# Instalación Completada
cd ~
sudo apt update && sudo apt upgrade -y

echo $'\n'$"*** Todo Listo, Cambiar shell y Reiniciar Computador. ***"
#Cambia Shell a ZSH
chsh -s $(which zsh)
