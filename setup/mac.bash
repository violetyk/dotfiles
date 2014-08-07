#!/bin/bash

if [ $(uname) = "Darwin" ]; then
  exit
fi


# home brew
if [ -z $(which brew) ]; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi
brew bundle


# ghq
go get github.com/motemen/ghq

ghq get shiguredo/packer-templates
ghq get violetyk/cake.vim
ghq get violetyk/scratch-utillity
ghq get violetyk/w.vim
ghq get violetyk/neocomplete-php.vim
ghq get violetyk/neosnippet-cakephp2
ghq get violetyk/neosnippet-rails
ghq get nanapi/nanapi.vim
ghq get seebi/dircolors-solarized
