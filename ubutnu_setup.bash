#!/bin/bash

## define colors
RED='\033[0;31m'
YEL='\033[0;33m'
NC='\033[0m' # No Color

## settings
reset
echo -e "${YEL}Starting to change settings ${NC}"
echo "change enabled=0"
sudo gedit /etc/default/apport


## system update
echo -e "${YEL}Starting to update the system ${NC}"
sudo apt-get -y update
sudo apt-get -y upgrade


## apps
echo ""
echo ""
echo -e "${YEL}Starting to install apps ${NC}"

# vlc
sudo apt-get -y install vlc

# jabref
sudo apt-get -y install jabref

# texstudio
sudo apt-add-repository ppa:blahota/texstudio
sudo apt-get -y update
sudo apt-get -y install texstudio

# git
sudo apt-get -y purge runit
sudo apt-get -y purge git-all
sudo apt-get -y purge git
sudo apt-get -y autoremove
sudo apt -y update
sudo apt -y install git

# tmux
sudo apt-get -y install tmux

# weather widget
sudo add-apt-repository ppa:atareao/atareao
sudo apt-get update
sudo apt-get -y install my-weather-indicator

# red-shift
sudo apt-get -y install redshift-gtk

# invert color space
sudo apt-get -y install xcalib

# g-parted
sudo apt-get -y install gparted

# pip
sudo apt-get -y install python-pip python3-pip

# powerline
pip install --user powerline-status

# powerline fonts
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# install curl
sudo apt-get -y install curl

# install oh-my-zsh
sudo apt-get -y install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo ""
echo -e "${YEL}Change ZSH_THEME="robbyrussell" to ZSH_THEME="agnoster" ${NC}"
echo -e "${YEL}Then ctrl+O > enter > ctrl+x ${NC}"
gedit ~/.zshrc
echo "DEFAULT_USER = $USER prompt_context(){}" >> ~/.zshrc

# open tmux by default
echo '[[ $TERM != "screen" ]] && exec tmux' >> ~/.zshrc

# uniform-icons theme
# sudo add-apt-repository ppa:noobslab/icons2
# sudo apt-get update
# sudo apt-get install uniform-icons

# other apps to be installed manually
echo ""
echo ""
echo -e "${YEL}Install these apps manually ${NC}"
echo "atom: https://atom.io/download/deb"
echo "gitkraken: https://www.gitkraken.com/download"
echo "anaconda: https://www.continuum.io/downloads"

# manual settings
echo ""
echo ""
echo -e "${YEL}Change these settings manually${NC}"
echo "Add shortcut Super+Ctrl+C for xcalib -invert -alter"
echo "Add solarized_light to ~/.config/texstudio/texstudio.ini"
