#!/bin/bash

cd ~
mkdir bin swap backup tmp memo tags src .trash .tmux
mkdir -p ~/etc/profile.d
cd ~/etc/profile.d
curl -S -o ~/etc/profile.d/git-prompt.sh https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
curl -S -o ~/etc/profile.d/git-completion.bash https://raw.github.com/git/git/master/contrib/completion/git-completion.bash

ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.profile ~/.profile
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.ctags ~/.ctags
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.tigrc ~/.tigrc
ln -sf ~/dotfiles/.agignore ~/.agignore
ln -sf ~/dotfiles/.gitignore ~/.gitignore
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.vim/bundle/dircolors-solarized/dircolors.ansi-universal ~/.dircolors
ln -sf ~/dotfiles/Brewfile ~/Brewfile

cd ~/.vim/manual
curl -L -o php_manual_ja.tar.gz http://jp1.php.net/get/php_manual_ja.tar.gz/from/this/mirror
tar xf php_manual_ja.tar.gz
mv php-chunked-xhtml php_manual_ja

# Mac
if [ `uname` = "Darwin" ]; then
  # home brew
  if [ -z `which brew` ]; then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi
  brew bundle


  # ghq
  cd ~
  go get github.com/motemen/ghq

  ghq get shiguredo/packer-templates
  ghq get violetyk/cake.vim
  ghq get violetyk/scratch-utillity
  ghq get violetyk/w.vim
  ghq get violetyk/neocomplete-php.vim
  ghq get violetyk/neosnippet-cakephp2
  ghq get violetyk/neosnippet-rails
  ghq get nanapi/nanapi.vim

  # packer
  # ghq look shiguredo/packer-templates
  # cd ubuntu-14.04/
  # packer build -only=virtualbox-iso template.json
  # vagrant box add ubuntu-14.04 ubuntu-14-04-x64-virtualbox.box


fi


cd ~/dotfiles/
git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim
git clone git://github.com/seebi/dircolors-solarized ~/dotfiles/.vim/bundle/dircolors-solarized
vim  +NeoBundleInstall +q
