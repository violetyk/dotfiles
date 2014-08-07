#!/bin/bash


# php manual
mkdir -p ${HOME}/.vim/manual
curl -L -o ${HOME}/.vim/manual/php_manual_ja.tar.gz http://jp1.php.net/get/php_manual_ja.tar.gz/from/this/mirror
tar xf ${HOME}/.vim/manual/php_manual_ja.tar.gz
mv ${HOME}/.vim/manual/php-chunked-xhtml ${HOME}/.vim/manual/php_manual_ja


# setup neobundle
mkdir -p "${HOME}/.vim/bundle"
git clone git://github.com/Shougo/neobundle.vim ${HOME}/dotfiles/.vim/bundle/neobundle.vim
vim  +NeoBundleInstall +q
