#!/bin/bash

## define colors
RED='\033[0;31m'
YEL='\033[0;33m'
NC='\033[0m' # No Color

## settings
reset
echo -e "${YEL}Starting to change settings ${NC}"
echo "change enabled=0"
read -p "press enter to continue"
sudo vi /etc/default/apport


## system update
echo -e "${YEL}Starting to update the system ${NC}"
sudo apt-get -y update
sudo apt-get -y upgrade

# update git submodules
echo ""
echo ""
echo -e "${YEL}Updating supmodules ${NC}"
git submodule update --init

## apps
echo ""
echo ""
echo -e "${YEL}Starting to install apps ${NC}"

# vlc
echo ""
echo -e "${YEL}Installing VLC ${NC}"
sudo apt-get -y install vlc

# jabref
# echo ""
# echo -e "${YEL}Installing JabRef ${NC}"
# sudo apt-get -y install jabref


# tmux
echo ""
echo -e "${YEL}Installing tmux ${NC}"
sudo apt-get -y install tmux

# weather widget
# echo ""
# echo -e "${YEL}Installing Weather Widget ${NC}"
# sudo add-apt-repository ppa:atareao/atareao
# sudo apt-get update
# sudo apt-get -y install my-weather-indicator

# red-shift
sudo apt-get -y install redshift-gtk

# invert color space
# echo ""
# echo -e "${YEL}Installing xcalib ${NC}"
# sudo apt-get -y install xcalib

# g-parted
echo ""
echo -e "${YEL}Installing gparted ${NC}"
sudo apt-get -y install gparted

# pip
echo ""
echo -e "${YEL}Installing pip ${NC}"
sudo apt-get -y install python-pip python3-pip
pip install --upgrade pip

# powerline
# echo ""
# echo -e "${YEL}Installing powerline ${NC}"
# pip install --user powerline-status
# cd powerline-shell
# sudo python setup.py install

# powerline fonts
echo ""
echo -e "${YEL}Installing powrline fonts ${NC}"
cd fonts
./install.sh

mkdir -p ~/.local/share/fonts/
mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
# mkdir -p ~/.config/fontconfig/conf.d/
# mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
cd ..

# install curl
echo ""
echo -e "${YEL}Installing curl ${NC}"
sudo apt-get -y install curl

# install oh-my-zsh
echo ""
echo -e "${YEL}Installing zsh ${NC}"
sudo apt-get -y install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install powerlevel10k
echo ""
echo -e "${YEL}Installing powerlevel10k ${NC}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# install tmux addons
echo ""
echo -e "${YEL}Installing tmux addons ${NC}"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install Sinhala
echo ""
echo -e "${YEL}Installing Sinhala ${NC}"
sudo apt-get -y install ibus-m17n

# copying dotfiles
echo ""
echo -e "${YEL}Copying dotfiles ${NC}"
cp bashrc ~/.bashrc
cp zshrc ~/.zshrc
cp tmux.conf ~/.tmux.conf
cp vimrc ~/.vimrc
# cp powerline-shell.json ~/.powerline-shell.json

# Vim Plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "DEFAULT_USER = $USER prompt_context(){}" >> ~/.zshrc

# uniform-icons theme
# sudo add-apt-repository ppa:noobslab/icons2
# sudo apt-get update
# sudo apt-get install uniform-icons

echo ""
echo -e "${YEL}Setting up git params ${NC}"
read -p "git user.name? " name
git config --global user.email "kanishkegb@gwu.edu"
git config --global user.name "$name"
git config --global push.default matching
git config --global core.editor vim

ssh-keygen -t ed25519 -C "kanishkegb@gwu.edu"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub

echo ""
echo -e "${YEL}Installing vim${NC}"
sudo apt-get -y install vim-gnome

# other apps to be installed manually
# echo ""
# echo ""
# echo -e "${YEL}Install these apps manually ${NC}"
# echo "anaconda: https://www.continuum.io/downloads"

# manual settings
echo ""
echo ""
echo -e "${YEL}Change these settings manually${NC}"
echo "Add solarized_light to ~/.config/texstudio/texstudio.ini"
echo "Add the Sinhala keyboard in Language Settings"
echo "Install tmux plugins by pressing 'prefix+I'"
echo "Open vim and run PlugInstall"
