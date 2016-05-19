#!/bin/bash -e

source variables.sh

cd $WORKSPACE

git clone https://github.com/pivotal-cf/cf-redis-release.git
cd cf-redis-release

sed -i -- "s/director_uuid: REPLACE_ME/director_uuid: $BOSH_UUID/g" templates/sample_stubs/meta-warden.yml
sed -i -- "s/bosh-lite.com/$CF_DOMAIN/g" templates/sample_stubs/meta-warden.yml

./scripts/generate-deployment-manifest warden > cf-redis.yml

bosh upload release releases/cf-redis/cf-redis-424.yml
bosh deployment cf-redis.yml
bosh -n deploy

# Register broker
bosh run errand broker-registrar
