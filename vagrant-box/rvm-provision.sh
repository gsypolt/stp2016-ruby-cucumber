#!/bin/bash
echo "--- Make a directory for automation development then go to this directory ---"
mkdir -p ~/work/github

echo "--- Installing RVM first we need to import public key in our system then use curl to install rvm in our system ---"
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm

echo "--- Install all the dependencies for installing Ruby automatically on system using below command ---"
rvm requirements

echo "--- Install ruby version ---"
rvm install 2.2.1

echo "--- Setup default ruby version ---"
rvm --default use 2.2.1
