#!/bin/bash

rbenv install -v 2.1.1
rbenv global 2.1.1
rbenv rehash

gem install bundler
rbenv rehash

bundle install --gemfile=$HOME/dotfiles/Gemfile
rbenv rehash
