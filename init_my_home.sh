#!/bin/sh

cd ~
mkdir swap backup
ln -sf ~/dotfiles/.bashrc .bashrc
ln -sf ~/dotfiles/.vimrc .vimrc
ln -sf ~/dotfiles/.vim .vim
ln -sf ~/dotfiles/.ctags .ctags
ln -sf ~/dotfiles/.tmux.conf .tmux.conf
ln -sf ~/dotfiles/.gitignore .gitignore
ln -sf ~/dotfiles/.gitconfig .gitconfig

cd ~/dotfiles/
git submodule init
git submodule update

cd ~
