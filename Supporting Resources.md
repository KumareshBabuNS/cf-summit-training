# Supporting scripts/resources

## Stemcells

* Previous stemcell: https://s3.amazonaws.com/bosh-warden-stemcells/bosh-stemcell-3126-warden-boshlite-ubuntu-trusty-go_agent.tgz
* Latest stemcell: https://s3.amazonaws.com/bosh-warden-stemcells/bosh-stemcell-3147-warden-boshlite-ubuntu-trusty-go_agent.tgz

## Steps to deploy

1. [Prepare the environment](scripts/00-prepare-environment.sh)
2. [Route requests internally](scripts/01-route-requests.sh)
3. [Deploy CF - Full](scripts/03-deploy-cf.sh)
3. [Deploy CF - With release](scripts/03-deploy-cf-with-release.sh)
4. [Deploy Redis - Full](scripts/04-deploy-redis-full.sh)
5. [Deploy Redis - With release](scripts/04-deploy-redis-with-release.sh)
