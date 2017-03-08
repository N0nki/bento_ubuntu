#!/bin/sh

echo "provision_node.sh"
pip install -U pip3

echo "clone dotfiles"
cd ~/
git clone https://github.com/N0nki/dotfiles

echo "setup vim"
sh dotfiles/vim/setup_vim.sh

echo "setup neovim"
# mkdir ~/.config
sh dotfiles/nvim/setup_nvim.sh

echo "Ruby"
echo "rbenv"
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
~/.rbenv/bin/rbenv init
source .bashrc
type rbenv
echo "ruby-build"
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

echo "Python"
echo "pyenv"
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
exec $SHELL
