#!/bin/bash

set -e

source variables.sh

AWS_MANIFEST_STUB=$WORKSPACE/aws_manifest_stub.yml

echo Bosh director lives on: $BOSH_DIRECTOR_IP
echo CF_RELEASE is at $CF_RELEASE

cd $WORKSPACE

echo Installing RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.0
source /home/ubuntu/.rvm/scripts/rvm
# Fix for RVM root .gem dir
sudo chown ubuntu:ubuntu ~/.gem -R
gem install bundler   --no-rdoc --no-ri
gem install bosh_cli  --no-rdoc --no-ri

echo Installing spiff
wget -qq https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.7/spiff_linux_amd64.zip
unzip -q -o spiff_linux_amd64.zip
sudo mv spiff /usr/bin/
rm spiff_linux_amd64.zip

echo Creating stub manifest for system domain $BOSH_DIRECTOR_IP.xip.io

cat > $AWS_MANIFEST_STUB <<EOL
---
properties:
  domain: $BOSH_DIRECTOR_IP.xip.io
EOL

echo Targeting Bosh Lite
bosh target $BOSH_DIRECTOR_IP lite

echo Uploading stemcell
bosh -q -n upload stemcell --skip-if-exists $BOSH_LITE_STEMCELL

echo Cloning CloudFoundry from GitHub...
git clone -q https://github.com/cloudfoundry/cf-release.git

cd cf-release

echo Updating CF release
./scripts/update &>/dev/null

echo Generating manifest
./scripts/generate-bosh-lite-dev-manifest $AWS_MANIFEST_STUB

echo Creating release
bosh create release --name cf
echo Uploading release
bosh -n upload release
echo Deploying!
bosh -n deploy
