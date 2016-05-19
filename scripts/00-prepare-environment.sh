#!/bin/bash -e

cat > define-workspace.sh <<EOL
export WORKSPACE=$HOME/workspace
export RESOURCES=$WORKSPACE/cf-summit-training
EOL

source define-workspace.sh
rm define-workspace.sh

sudo apt-get update --fix-missing -qq
sudo apt-get install htop git wget unzip libgmp3-dev -y -qq
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

mkdir -p $WORKSPACE
cd $WORKSPACE

git clone https://github.com/eljuanchosf/cf-summit-training.git
