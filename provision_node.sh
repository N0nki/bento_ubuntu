#!/bin/sh

echo "provision_node.sh"
echo "clone dotfiles"
cd ~/
git clone https://github.com/N0nki/dotfiles

# echo "setup neovim"
# mkdir ~/.config
# sh dotfiles/nvim/setup_nvim.sh

# echo "setup vim"
# sh dotfiles/vim/setup_vim.sh

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
pip3 install --upgrade pip
# curl -KL https://bootstrap.pypa.io/get-pip.py | sudo python3
# sudo apt-get install python3-venv

echo "glpk"
wget http://ftp.gnu.org/gnu/glpk/glpk-4.61.tar.gz
gzip -d glpk-4.61.tar.gz
tar -x < glpk-4.61.tar
cd glpk-4.61
./configure
make
make check
sudo make install
ldconfig

echo "ns3"
cd
mkdir workspace
cd workspace
wget http://www.nsnam.org/release/ns-allinone-3.26.tar.bz2
tar xjf ns-allinone-3.26.tar.bz2
cd ns-allinone-3.26
./build.py --enable-examples --enable-tests
