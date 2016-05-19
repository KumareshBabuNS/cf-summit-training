# Supporting scripts/resources

## Stemcells

* Previous stemcell:
* Latest stemcell: https://s3.amazonaws.com/bosh-warden-stemcells/bosh-stemcell-3147-warden-boshlite-ubuntu-trusty-go_agent.tgz

## Steps to deploy

1. [Prepare the environment](00-prepare-environment.sh)
2. [Route requests internally](01-route-requests.sh)
3. [Deploy CF - Full](03-deploy-cf.sh)
4. [Deploy Redis release](04-deploy-redis.sh)
