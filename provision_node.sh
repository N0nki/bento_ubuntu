!/bin/sh

echo "provision_node.sh"
pip install -U pip3

echo "clone dotfiles"
cd ~/
git clone https://github.com/N0nki/dotfiles

echo "setup neovim"
mkdir ~/.config
cd dotfiles/nvim
sh ./setup_nvim.sh
