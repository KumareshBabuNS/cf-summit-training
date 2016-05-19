#!/bin/bash -e

sudo apt-get update --fix-missing -qq
sudo apt-get install htop git wget unzip libgmp3-dev -y -qq
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

cd $WORKSPACE

git clone https://github.com/eljuanchosf/cf-summit-training.git
