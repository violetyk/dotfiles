#!/bin/sh

cd ~
mkdir swap backup tmp
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

cd ~/.vim/manual
wget http://www.php.net/get/php_manual_ja.tar.gz/from/jp.php.net/mirror -O php_manual_ja.tar.gz
tar xf php_manual_ja.tar.gz
mv php-chunked-xhtml php_manual_ja

vim -u ~/dotfiles/bundles.vim +BundleInstall +q
