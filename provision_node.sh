#!/bin/sh

echo "provision_node.sh"
echo "clone dotfiles"
cd ~/
git clone https://github.com/N0nki/dotfiles

echo "install vim"
git clone https://github.com/vim/vim.git
cd ~/vim
git pull
cd ~/vim/src/
./configure --with-features=huge --enable-gui=gnome2 --enable-perlinterp --enable-pythoninterp --enable-python3interp --enable-rubyinterp --enable-luainterp --with-luajit --enable-fail-if-missing
make
sudo make install
cd ~/

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
echo 'python3 -m venv ~/myenv' >> setup_myenv.sh
echo 'source ~/myenv/bin/activate' >> setup_myenv.sh
echo 'pip install --upgrade pip' >> setup_myenv.sh
echo 'pip install -r ~/dotfiles/python/lab_ubuntu/requirements.txt' >> setup_myenv.sh
echo 'jupyter contrib nbextension install --user' >> setup_myenv.sh
echo 'jupyter nbextensions_configurator enable --user' >> setup_myenv.sh
echo 'deactivate' >> setup_myenv.sh
source ./setup_myenv.sh
echo 'alias myenv="source ~/myenv/bin/activate"' >>~/.bashrc

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

# echo "ns3"
# cd
# mkdir workspace
# cd workspace
# wget http://www.nsnam.org/release/ns-allinone-3.26.tar.bz2
# tar xjf ns-allinone-3.26.tar.bz2
# cd ns-allinone-3.26
# ./build.py --enable-examples --enable-tests
