#!/usr/bin/bash
sudo apt-get update
sudo apt-get install -y wget
# Instal git
sudo apt-get install -y git-core
# Install curl
sudo apt-get install -y curl
mkdir /download
cd /download && wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.9.0-1_amd64.deb
cd /download && pkg -i chefdk_0.9.0-1_amd64.deb
