#!/bin/bash

set -e

source variables.sh

echo Bosh director lives on: $BOSH_DIRECTOR_IP
echo CF_RELEASE is at $CF_RELEASE_DIR
echo CF_LAST_RELEASE is $CF_LAST_RELEASE

echo Targeting Bosh Lite
bosh target $BOSH_DIRECTOR_IP lite

echo Uploading stemcell
bosh -q -n upload stemcell --skip-if-exists $BOSH_LITE_STEMCELL

echo Creating release
bosh create release --name cf
echo Uploading release
bosh -n upload release
echo Deploying!
bosh -n deploy
