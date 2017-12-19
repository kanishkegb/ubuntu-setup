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
Install powerline fonts on Windows
  ```shell
  git clone https://github.com/powerline/fonts.git  
  cd fonts  
  ./install.ps1
  cd ..;rm -r -for ./fonts 
  ```

## Virtual Machine
### Setup Shared Folder - [link](https://help.ubuntu.com/community/VirtualBox/SharedFolders)
* Add a shared folder on Windows through the VB menu (C:\Documents\shared\_vm)
* On Ubuntu, create a directory with the same name (~\Documents\shared\_vm)
* In a terminal, cd to Documents
* Type: sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) shared\_vm shared\_vm/


## Drivers
* NVIDIA drivers: http://www.linuxandubuntu.com/home/how-to-install-latest-nvidia-drivers-in-linux
