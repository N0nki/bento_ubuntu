#!/bin/sh

echo "provision_root.sh"

echo "update package"
apt-get update
apt-get -y upgrade
# apt-get install ubuntu-desktop
# dpkg --configure -a

echo "ruby-build necessary packages"
apt-get install -y libssl-dev libreadline-dev zlib1g-dev

echo "install vim"
apt-get install -y vim vim-gnome

echo "install neovim"
apt-get install software-properties-common
add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install neovim
sudo apt-get install python3-dev python3-pip python-pip

echo "install git"
apt-get install -y git
