# cf-summit-training

## Introduction

Since the purpose of this training is to learn how to get around the BOSH and Cloud Foundry ecosystem, please ***do not use*** the scripts provided below unless you are **seriously stuck**  in some step. The `-full` versions of the scripts are for learning purposes after this training.

## AWS CloudFormation

1. Get the script: `wget https://raw.githubusercontent.com/eljuanchosf/cf-summit-training/master/cf-summit-cloudformation-template.json`.
2. If you don't have a [key pair](https://console.aws.amazon.com/ec2/v2/home?KeyPairs:sort=keyName), go and create one.
3. Go to [AWS Cloudformation](https://console.aws.amazon.com/cloudformation/).
4. Click on "Create Stack".
5. Choose the `cf-summit-cloudformation-template.json` file you downloaded.
6. Click "Next" and follow the instructions.

## Stemcells

* Previous stemcell: https://s3.amazonaws.com/bosh-warden-stemcells/bosh-stemcell-3126-warden-boshlite-ubuntu-trusty-go_agent.tgz
* Latest stemcell: https://s3.amazonaws.com/bosh-warden-stemcells/bosh-stemcell-3147-warden-boshlite-ubuntu-trusty-go_agent.tgz

## Scripts

1. [General variables](scripts/variables.sh) - Use `source variables.sh`.
1. [Prepare the environment](scripts/00-prepare-environment.sh)
1. [Route requests internally](scripts/01-route-requests.sh)
1. [Deploy CF - With release](scripts/03-deploy-cf-with-release.sh)
1. [Deploy CF - Full](scripts/03-deploy-cf-full.sh)
1. [Deploy Redis - With release](scripts/04-deploy-redis-with-release.sh)
1. [Deploy Redis - Full](scripts/04-deploy-redis-full.sh)
