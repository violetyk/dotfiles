#!/bin/sh

cd ~
mkdir swap backup tmp memo tags .trash .tmux
ln -sf ~/dotfiles/.bashrc .bashrc
ln -sf ~/dotfiles/.vimrc .vimrc
ln -sf ~/dotfiles/.vim .vim
ln -sf ~/dotfiles/.ctags .ctags
ln -sf ~/dotfiles/.tmux.conf .tmux.conf
ln -sf ~/dotfiles/.tmux-powerlinerc .tmux-powerlinerc
ln -sf ~/dotfiles/.gitignore .gitignore
ln -sf ~/dotfiles/.gitconfig .gitconfig
ln -sf ~/dotfiles/.config .config

cd ~/.vim/manual
wget http://jp1.php.net/get/php_manual_ja.tar.gz/from/this/mirror -O php_manual_ja.tar.gz
tar xf php_manual_ja.tar.gz
mv php-chunked-xhtml php_manual_ja

cd ~/dotfiles/
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# vim -u ~/dotfiles/bundles.vim +BundleInstall +q
vim  +NeoBundleInstall +q
