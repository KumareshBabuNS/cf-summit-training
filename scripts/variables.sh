#!/bin/bash -e

export DIRECTOR_IP=$(wget http://ipinfo.io/ip -qO -)
export BOSH_USER=admin
export BOSH_PASSWORD=admin
BOSH_LITE_STEMCELL="https://s3.amazonaws.com/bosh-warden-stemcells/bosh-stemcell-3126-warden-boshlite-ubuntu-trusty-go_agent.tgz"
BOSH_UUID=$(bosh status | grep UUID | awk -F'UUID' '{print $2}' | xargs)

WORKSPACE=$HOME/workspace
CF_RELEASE_DIR=$WORKSPACE/cf-release
CF_LAST_RELEASE="releases/cf-237.yml"
CF_DOMAIN=$(wget http://ipinfo.io/ip -qO -).xip.io

AWS_MANIFEST_STUB=$WORKSPACE/aws_manifest_stub.yml
