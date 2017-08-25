# ubuntu_setup
A bash file to install apps and changes settings when you install  a fresh copy of Ubuntu

## Running the files
Simply follow these steps:
- Download the bash file
- Open a new terminal
- cd to the download directory
- run bash file: 
>. ubuntu_setup.bash

## Virtual Machine
Setup Shared Folder - link
- Add a shared folder on Windows through the VB menu (C:\Documents\shared_vm)
- On Ubuntu, create a directory with the same name (~\Documents\shared_vm)
- In a terminal, cd to Documents
- Type: 
> sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) shared_vm shared_vm/
