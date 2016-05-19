#!/bin/bash

set -e

source variables.sh

echo Bosh director lives on: $BOSH_DIRECTOR_IP
echo Cloud Foundry release is $CF_RELEASE

echo Targeting Bosh Lite
bosh target $BOSH_DIRECTOR_IP lite

echo Uploading stemcell
bosh -q -n upload stemcell --skip-if-exists $BOSH_LITE_STEMCELL

cd $RESOURCES

echo Uploading release
bosh -n upload release $CF_RELEASE

sed -i -- "s/director_uuid: REPLACE_ME/director_uuid: $BOSH_UUID/g" $CF_MANIFEST
sed -i -- "s/bosh-lite.com/$CF_DOMAIN/g" $CF_MANIFEST

echo Set deployment
bosh -n deployment $CF_MANIFEST

echo Deploying!
bosh -n deploy
