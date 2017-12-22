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

# git
echo ""
echo -e "${YEL}Installing git ${NC}"
sudo apt-get -y purge runit
sudo apt-get -y purge git-all
sudo apt-get -y purge git
sudo apt-get -y autoremove
sudo apt -y update
sudo apt -y install git

# update git submodules
git submodule update --init

# tmux
echo ""
echo -e "${YEL}Installing tmux ${NC}"
sudo apt-get -y install tmux

g-parted
echo ""
echo -e "${YEL}Installing gparted ${NC}"
sudo apt-get -y install gparted

# pip
echo ""
echo -e "${YEL}Installing pip ${NC}"
sudo apt-get -y install python-pip python3-pip

# powerline
echo ""
echo -e "${YEL}Installing powerline ${NC}"
pip install --user powerline-status
cd powerline-shell
sudo python setup.py install

# powerline fonts
echo ""
echo -e "${YEL}Installing powrline fonts ${NC}"
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# install curl
echo ""
echo -e "${YEL}Installing curl ${NC}"
sudo apt-get -y install curl

# install oh-my-zsh
echo ""
echo -e "${YEL}Installing zsh ${NC}"
sudo apt-get -y install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "cp .bashrc ~/"
echo "cp .zshrc ~/"

# install tmux addons
echo ""
echo -e "${YEL}Installing tmux addons ${NC}"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install Sinhala
echo ""
echo -e "${YEL}Installing Sinhala ${NC}"
sudo apt-get -y install ibus-m17n

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
echo "Add the Sinhala keyboard in Language Settings"
