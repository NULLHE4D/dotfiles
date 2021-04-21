#!/bin/bash

# create symlinks for dotfiles
ln -sfv ~/.dotfiles/.bashrc ~/.bashrc
ln -sfv ~/.dotfiles/.profile ~/.profile
ln -sfv ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sfv ~/.dotfiles/.gitignore_global ~/.gitignore_global
ln -sfv ~/.dotfiles/.vimrc ~/.vimrc
ln -sfv ~/.dotfiles/proxychains4.conf /etc/proxychains4.conf
