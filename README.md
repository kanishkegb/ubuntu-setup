# Ubuntu Setup
A bash file to install apps and changes settings when you install  a fresh copy of Ubuntu

## Running the files
Simply follow these steps:
- Download the bash file
- Open a new terminal
- cd to the download directory
- run bash file:
  ```
  . ubuntu_setup.bash
  ```

## Ubuntu Bash on Windows
Clone ubuntu_setup on Windows. Do followings in PowerShell.
  ```shell
  git clone https://github.com/kanishkegb/ubuntu-setup.git
  cd ubuntu-setup
  git submodule update --init
  cd fonts  
  powershell -ExecutionPolicy ByPass -File .\install.ps1
  ```

## Vim
* First install Vim
  ```
  sudo apt-get install vim
  ```
* Plugin Manager
  ```
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```
* Install plugins
  ```
  vim
  :source ~/.vimrc
  :PlugInstall
  ```
  It might be required to press `q` at the end of the installation process.


## Virtual Machine
### Setup Shared Folder - [link](https://help.ubuntu.com/community/VirtualBox/SharedFolders)
* Add a shared folder on Windows through the VB menu (C:\Documents\shared\_vm)
* On Ubuntu, create a directory with the same name (~\Documents\shared\_vm)
* In a terminal, cd to Documents
* Type: sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) shared\_vm shared\_vm/


## Drivers
* NVIDIA drivers: http://www.linuxandubuntu.com/home/how-to-install-latest-nvidia-drivers-in-linux

## Common Aliases
```
alias ga='git add'
alias gst='git status'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias gl='git pull'
alias gp='git push'
alias gcam='git commit -am'
```
