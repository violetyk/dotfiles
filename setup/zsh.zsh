#!/bin/zsh

# see https://github.com/sorin-ionescu/prezto
CURRENT_DIR=$PWD

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
cd ${HOME}/.zprezto
git pull && git submodule update --init --recursive

cd $CURRENT_DIR
chsh -s /bin/zsh
