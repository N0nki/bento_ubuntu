#!/bin/sh

echo "provision_root.sh"

echo "update package"
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
apt-get install -y ubuntu-desktop
# dpkg --configure -a

echo "development environment"
apt-get install -y libssl-dev libreadline-dev zlib1g-dev build-essential libsqlite3-dev libgdbm-dev libbz2-dev sqlite3 tk-dev zip python3-dev python-dev python3-pip python-pip python3-venv git

echo "install vim"
apt-get install -y vim vim-gnome

echo "install neovim"
apt-get install software-properties-common
add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install neovim
