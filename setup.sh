#!/bin/sh

cd ~
mkdir swap backup tmp memo tags src .trash .tmux
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.ctags ~/.ctags
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.tmux-powerlinerc ~/.tmux-powerlinerc
ln -sf ~/dotfiles/.gitignore ~/.gitignore
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/dircolors-solarized/dircolors.ansi-universal ~/.dircolors

cd ~/.vim/manual
curl -L -o php_manual_ja.tar.gz http://jp1.php.net/get/php_manual_ja.tar.gz/from/this/mirror
tar xf php_manual_ja.tar.gz
mv php-chunked-xhtml php_manual_ja

cd ~/dotfiles/
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim  +NeoBundleInstall +q
