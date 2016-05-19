#!/bin/bash -e

export WORKSPACE=$HOME/workspace
export RESOURCES=$WORKSPACE/cf-summit-training

export BOSH_DIRECTOR_IP=$(wget http://ipinfo.io/ip -qO -)
export BOSH_USER=admin
export BOSH_PASSWORD=admin
export BOSH_LITE_STEMCELL="https://s3.amazonaws.com/bosh-warden-stemcells/bosh-stemcell-3147-warden-boshlite-ubuntu-trusty-go_agent.tgz"

bosh target $BOSH_DIRECTOR_IP lite

export BOSH_UUID=$(bosh status | grep UUID | awk -F'UUID' '{print $2}' | xargs)

export CF_DOMAIN=$(wget http://ipinfo.io/ip -qO -).xip.io
export CF_RELEASE="releases/cf-237.yml"
export CF_MANIFEST="manifests/cf.yml"

export CF_REDIS_RELEASE="releases/cf-redis-424.yml"
export CF_REDIS_MANIFEST="manifests/cf-redis.yml"
