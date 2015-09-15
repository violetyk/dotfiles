#!/bin/bash

if [ $(uname) != "Darwin" ]; then
  exit
fi


# home brew
if [ -z $(which brew) ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
cd ~

# Tap Formula
brew tap homebrew/binary
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew tap sanemat/font

# Make sure using latest Homebrew
brew update

# Packages
brew install git
brew install zsh
brew install wget
brew install w3m
brew install tig
brew install ag
brew install tmux
brew install libevent
brew install fontforge
brew install coreutils
brew install bash-completion
brew install openssl
brew install source-highlight
brew install cscope
brew install lua
brew install vim --HEAD --with-lua --with-luajit
brew install nodejs
brew install memcached
brew install packer
brew install mysql
# install php55
# install php55-mcrypt
#install php55-intl
brew install composer
brew install phpctags
brew install automake
brew install pkg-config
#install --vim-powerline ricty
brew install go
brew install rbenv ruby-build

brew linkapps

# Remove outdated versions
brew cleanup



# go & ghq & peco
go get golang.org/x/tools/cmd/goimports
go get golang.org/x/tools/cmd/godoc
go get golang.org/x/tools/cmd/vet
go get golang.org/x/tools/cmd/cover
go get github.com/nsf/gocode
go get github.com/golang/lint
go get code.google.com/p/rog-go/exp/cmd/godef
go get github.com/jstemmer/gotags
go get github.com/mattn/gom

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
