#!/bin/bash

if [ $(uname) != "Darwin" ]; then
  exit
fi


# home brew
if [ -z $(which brew) ]; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi
cd ~
brew bundle


# ghq & peco
go get github.com/motemen/ghq
go get github.com/peco/peco/cmd/peco

ghq get shiguredo/packer-templates
ghq get violetyk/cake.vim
ghq get violetyk/scratch-utillity
ghq get violetyk/w.vim
ghq get violetyk/neocomplete-php.vim
ghq get violetyk/neosnippet-cakephp2
ghq get violetyk/neosnippet-rails
ghq get nanapi/nanapi.vim
ghq get seebi/dircolors-solarized
ghq get tomislav/osx-terminal.app-colors-solarized

# vim-poserline ricty
cp -f /usr/local/Cellar/ricty/3.2.3/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf # remove font cache

# dircolors-solarized
ln -sf ${HOME}/src/github.com/seebi/dircolors-solarized/dircolors.256dark ~/.dircolors
