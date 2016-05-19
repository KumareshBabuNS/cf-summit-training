#!/bin/bash -e
export BOSH_DIRECTOR_IP=$(wget http://ipinfo.io/ip -qO -)
export BOSH_USER=admin
export BOSH_PASSWORD=admin
export BOSH_LITE_STEMCELL="https://s3.amazonaws.com/bosh-warden-stemcells/bosh-stemcell-3147-warden-boshlite-ubuntu-trusty-go_agent.tgz"

bosh target $BOSH_DIRECTOR_IP lite

export BOSH_UUID=$(bosh status | grep UUID | awk -F'UUID' '{print $2}' | xargs)

export CF_DOMAIN=$(wget http://ipinfo.io/ip -qO -).xip.io
export CF_RELEASE=$RESOURCES/"releases/cf-237.yml"
export CF_MANIFEST=$RESOURCES/"manifests/cf.yml"
export CF_RELEASE_DIR=$WORKSPACE/cf-release

export CF_REDIS_RELEASE=$RESOURCES/"releases/cf-redis-424.yml"
export CF_REDIS_MANIFEST=$RESOURCES/"manifests/cf-redis.yml"
export CF_REDIS_RELEASE_DIR=$WORKSPACE/cf-redis-release
