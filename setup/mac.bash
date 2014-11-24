#!/bin/bash

if [ $(uname) != "Darwin" ]; then
  exit
fi


# home brew
if [ -z $(which brew) ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
cd ~
brew tap homebrew/boneyard
brew bundle


# ghq & peco
go get github.com/motemen/ghq
go get github.com/peco/peco/cmd/peco
go get github.com/zimbatm/direnv

ghq get -p shiguredo/packer-templates
ghq get -p violetyk/cake.vim
ghq get -p violetyk/scratch-utillity
ghq get -p violetyk/w.vim
ghq get -p violetyk/neocomplete-php.vim
ghq get -p violetyk/neosnippet-cakephp2
ghq get -p violetyk/neosnippet-rails
ghq get -p nanapi/nanapi.vim
ghq get -p seebi/dircolors-solarized
ghq get -p tomislav/osx-terminal.app-colors-solarized

# vim-poserline ricty
#cp -f /usr/local/Cellar/ricty/3.2.3/share/fonts/Ricty*.ttf ~/Library/Fonts/
#fc-cache -vf # remove font cache

# dircolors-solarized
ln -sf ${HOME}/src/github.com/seebi/dircolors-solarized/dircolors.256dark ~/.dircolors
