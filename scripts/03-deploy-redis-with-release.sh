#!/bin/bash -e

set -e

source variables.sh

echo Bosh director lives on: $BOSH_DIRECTOR_IP
echo Redis release is $CF_REDIS_RELEASE

echo Targeting Bosh Lite
bosh target $BOSH_DIRECTOR_IP lite

echo Uploading stemcell
bosh -q -n upload stemcell --skip-if-exists $BOSH_LITE_STEMCELL

cd $RESOURCES

echo Uploading release
bosh -n upload release $CF_REDIS_RELEASE

sed -i -- "s/director_uuid: REPLACE_ME/director_uuid: $BOSH_UUID/g" $CF_REDIS_MANIFEST
sed -i -- "s/bosh-lite.com/$CF_DOMAIN/g" $CF_REDIS_MANIFEST

echo Set deployment
bosh -n deployment $CF_REDIS_MANIFEST

echo Deploying!
bosh -n deploy

# Register broker
bosh run errand broker-registrar
