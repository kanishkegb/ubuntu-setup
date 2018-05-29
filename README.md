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


## Backuing-Up
* GitHub
  1. Install dependencies
    ```
    pip install pygithub
    ```
  2. Create a [personal access token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/) for GitHub. Copy the token and do the following in the terminal before running the code.
  ```
  export GH_ACCSS_TKN=personal_access_token_generated_in_GitHub
  ```
  You have to do this every time you run the code. You can skip this if you add the above line to `~/.bashrc` or `~/.zshrc`.
  3. make sure that you are connected to GitHub with an [ssh key](https://help.github.com/articles/connecting-to-github-with-ssh/).
  4. Run the code
    ```
    cd backing-up
    python backup_github_repos.py
    ```
