#!/usr/bin/env bash

echo "--- Let's get to work, installing  ---"

echo "--- Updating packages list ---"
sudo apt-get update

echo "--- Installing Curl ---"
sudo apt-get install curl

echo "--- Installing Git ---"
sudo apt-get install git

echo "--- Clone Linuxbrew ---"
git clone https://github.com/Homebrew/linuxbrew.git ~/.linuxbrew

echo "--- All Done!!! ---"
