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


## apps
echo ""
echo ""
echo -e "${YEL}Starting to install apps ${NC}"

# vlc
echo ""
echo -e "${YEL}Installing VLC ${NC}"
sudo apt-get -y install vlc

# update git submodules
git submodule update --init

# tmux
echo ""
echo -e "${YEL}Installing tmux ${NC}"
sudo apt-get -y install tmux

# red-shift
sudo apt-get -y install redshift-gtk

# invert color space
echo ""
echo -e "${YEL}Installing xcalib ${NC}"
sudo apt-get -y install xcalib

# pip
echo ""
echo -e "${YEL}Installing pip ${NC}"
sudo apt-get -y install python-pip python3-pip
pip install --upgrade pip

# powerline fonts
echo ""
echo -e "${YEL}Installing powrline fonts ${NC}"
cd fonts
./install.sh

mkdir -p ~/.local/share/fonts/
mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mkdir -p ~/.config/fontconfig/conf.d/
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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k
echo ""
echo -e "${YEL}Installing powerlevel10k ${NC}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install tmux addons
echo ""
echo -e "${YEL}Installing tmux addons ${NC}"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# copying dotfiles
echo ""
echo -e "${YEL}Copying dotfiles ${NC}"
cp bashrc ~/.bashrc
cp zshrc ~/.zshrc
cp tmux.conf ~/.tmux.conf
cp vimrc ~/.vimrc
cp powerline-shell.json ~/.powerline-shell.json

# Vim Plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "DEFAULT_USER = $USER prompt_context(){}" >> ~/.zshrc

echo ""
echo -e "${YEL}Setting up git params ${NC}"
read -p "git user.name? " name
git config --global user.email "kanishkegb@gwu.edu"
git config --global user.name "$name"
git config --global push.default matching
git config --global core.editor vim

ssh-keygen -t rsa -b 4096 -C "kanishkegb@gwu.edu"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub

# manual settings
echo ""
echo ""
echo -e "${YEL}Change these settings manually${NC}"
echo "Install tmux plugins by pressing 'prefix+I'"
