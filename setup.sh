#!/bin/sh

cd ~
mkdir swap backup tmp memo tags src .trash .tmux
mkdir -p ~/etc/profile.d
cd ~/etc/profile.d
curl -S -o ~/etc/profile.d/git-prompt.sh https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
curl -S -o ~/etc/profile.d/git-completion.bash https://raw.github.com/git/git/master/contrib/completion/git-completion.bash

ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.ctags ~/.ctags
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.tmux-powerlinerc ~/.tmux-powerlinerc
ln -sf ~/dotfiles/.gitignore ~/.gitignore
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.vim/bundle/dircolors-solarized/dircolors.ansi-universal ~/.dircolors

cd ~/.vim/manual
curl -L -o php_manual_ja.tar.gz http://jp1.php.net/get/php_manual_ja.tar.gz/from/this/mirror
tar xf php_manual_ja.tar.gz
mv php-chunked-xhtml php_manual_ja

cd ~/dotfiles/
git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim
git clone git://github.com/erikw/tmux-powerline ~/dotfiles/.vim/bundle/tmux-powerline
git clone git://github.com/seebi/dircolors-solarized ~/dotfiles/.vim/bundle/dircolors-solarized
vim  +NeoBundleInstall +q
