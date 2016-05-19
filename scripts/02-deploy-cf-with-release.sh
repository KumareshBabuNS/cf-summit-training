#!/bin/bash

set -e

source variables.sh

echo Bosh director lives on: $BOSH_DIRECTOR_IP
echo Cloud Foundry release is $CF_RELEASE_DIR/releases/$CF_RELEASE
echo Cloud Foundry manifest is $CF_MANIFEST

echo Targeting Bosh Lite
bosh target $BOSH_DIRECTOR_IP lite

echo Uploading stemcell
bosh -q -n upload stemcell --skip-if-exists $BOSH_LITE_STEMCELL

git clone -q https://github.com/cloudfoundry/cf-release.git $CF_RELEASE_DIR
cd $CF_RELEASE_DIR
echo Updating CF release
./scripts/update &>/dev/null

echo Uploading release
bosh -n upload release releases/$CF_RELEASE

sed -i -- "s/director_uuid: REPLACE_ME/director_uuid: $BOSH_UUID/g" $CF_MANIFEST
sed -i -- "s/bosh-lite.com/$CF_DOMAIN/g" $CF_MANIFEST

echo Set deployment
bosh -n deployment $CF_MANIFEST

echo Deploying!
bosh -n deploy
