#!/bin/sh

# Update packages and Upgrade system - apt-get or yum
sudo apt-get update -y
sudo apt-get install python3.6 -y

# Get git
echo 'Installing Git..'
sudo apt-get install git -y

# Get git repo
echo 'Getting the repo..'
git clone https://bla.git

# Install requirements files
echo 'Installing the necessary packages'
pip install -r requirements.txt

# Plus any other necessary steps here
source new_scripts.sh
