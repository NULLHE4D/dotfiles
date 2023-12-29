#!/bin/bash

# create symlinks for dotfiles
echo "creating symlinks.."
ln -sfv ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sfv ~/.dotfiles/.gitignore_global ~/.gitignore_global
ln -sfv ~/.dotfiles/.vimrc ~/.vimrc
#ln -sfv ~/.dotfiles/proxychains4.conf /etc/proxychains4.conf
ln -sfv ~/.dotfiles/.tmux.conf ~/.tmux.conf
#ln -sfv ~/.dotfiles/graftcp-local.conf /etc/graftcp-local/graftcp-local.conf

echo "creating directories.."
mkdir -p ~/.vim/swp
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/plugged
mkdir -p ~/.config/nvim

echo "copying files.."
cp -r ~/.dotfiles/.vim/UltiSnips ~/.vim

echo "doing other stuff.."
cat ~/.dotfiles/.bashrc >> ~/.bashrc
cat ~/.dotfiles/init.vim >> ~/.config/nvim/init.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "restarting services.."
#service graftcp-local restart

echo "done.."
