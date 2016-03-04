#!/bin/bash

echo "-- Install Homebrew ---"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

echo "--- Install RVM ---"
curl -sSL https://get.rvm.io | bash -s stable --ruby;
source ~/.rvm/scripts/rvm;

echo "--- Install all the dependencies for installing Ruby automatically on system using below command ---"
rvm requirements;
rvm list;

echo "--- Install ruby version ---"
rvm install 2.2.1;

echo "--- Setup default ruby version ---"
rvm --default use 2.2.1;

echo "--- Install bundler gem ---"
gem install bundler;
