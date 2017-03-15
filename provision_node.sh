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
source .bashrc
# exec $SHELL

echo "glpk"
wget http://ftp.gnu.org/gnu/glpk/glpk-4.61.tar.gz
gzip -d glpk-4.61.tar.gz
tar -x < glpk-4.61.tar
cd glpk-4.61
./configure
make
make check
make install
ldconfig

echo "ns3"
cd
mkdir workspace
cd workspace
wget http://www.nsnam.org/release/ns-allinone-3.26.tar.bz2
tar xjf ns-allinone-3.26.tar.bz2
cd ns-allinone-3.26
./build.py --enable-examples --enable-tests
# ./test.py -c core
