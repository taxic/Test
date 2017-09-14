#!/bin/bash

# Before you run the bash code, make sure you have installed:
# vim tmux git curl ...
# For Ubuntu users:
#	sudo apt-get update
#	sudo apt-get install vim tmux git curl

# Sync vimrc
if [ ! -f ~/.vimrc ]; then
	cp ./vimrc ~/.vimrc
fi
if ! cmp ~/.vimrc ./vimrc >/dev/null 2>&1
then
	cp ./vimrc ~/.vimrc
fi

# Add tmux.conf
if [ ! -f ~/.tmux.conf ]; then
	cp ./tmux.conf ~/.tmux.conf
fi

# install NERDTree
if [ ! -d ~/.vim/autoload ]; then
	mkdir -p ~/.vim/autoload 
fi
if [ ! -d ~/.vim/bundle ]; then
	mkdir -p ~/.vim/bundle
fi

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git 

# Add Solidity Source Code Highlight
git clone https://github.com/tomlion/vim-solidity.git ~/.vim/bundle/vim-solidity
