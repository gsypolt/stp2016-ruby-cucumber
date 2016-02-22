#!/bin/bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

# Install RVM
curl -sSL https://get.rvm.io | bash -s stable --ruby;
source ~/.rvm/scripts/rvm;
rvm list;
rvm install 2.2.1;
rvm --default use 2.2.1;

# Install Bundler
gem install bundler;
