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

# texstudio
# sudo apt-add-repository ppa:blahota/texstudio
# sudo apt-get -y update
# sudo apt-get -y install texstudio

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

# g-parted
sudo apt-get -y install gparted

# pip
sudo apt-get -y install python-pip python3-pip

# other apps to be installed manually
echo ""
echo ""
echo -e "${YEL}Install these apps manually ${NC}"
echo "atom: https://atom.io/download/deb"
echo "gitkraken: https://www.gitkraken.com/download"
echo "anaconda: https://www.continuum.io/downloads"