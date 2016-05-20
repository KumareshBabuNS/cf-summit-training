# Operating The Foundry - Training resources

## AWS CloudFormation

1. Get the script: `wget https://goo.gl/7JfDvZ -O boshlite-template.json`.
2. If you don't have a [key pair](https://console.aws.amazon.com/ec2/v2/home?KeyPairs:sort=keyName), go and create one.
3. Go to [AWS Cloudformation](https://console.aws.amazon.com/cloudformation/).
4. Click on "Create Stack".
5. Choose the `boshlite-template.json` file you downloaded.
6. Click "Next" and follow the instructions.

## Prepare the envionment

1. SSH into your server
2. Get the following file:
  * `wget https://raw.githubusercontent.com/eljuanchosf/cf-summit-training/master/scripts/00-prepare-environment.sh`
  * `wget https://raw.githubusercontent.com/eljuanchosf/cf-summit-training/master/scripts/01-route-requests.sh`
3. Run those files:
  * `source 00-prepare-environment.sh`
  * `./01-route-requests.sh`
4. You are ready!

## Stemcells

* v3126: https://s3.amazonaws.com/bosh-warden-stemcells/bosh-stemcell-3126-warden-boshlite-ubuntu-trusty-go_agent.tgz
* v3147: https://s3.amazonaws.com/bosh-warden-stemcells/bosh-stemcell-3147-warden-boshlite-ubuntu-trusty-go_agent.tgz

## Scripts

### WARNING

Since the purpose of this training is to learn how to get around the BOSH and Cloud Foundry ecosystem, please ***do not use*** the "**`deploy`**" scripts provided below unless you are **seriously stuck**  in some step. The `-full` versions of the scripts are for learning purposes after this training, and the decryption password will be provided by your instructors at the closing.

1. [Prepare the environment](scripts/00-prepare-environment.sh)
1. [Route requests internally](scripts/01-route-requests.sh)
1. [General variables](scripts/variables.sh.gpg) - Use `source variables.sh`.
1. [Deploy CF - With release](scripts/02-deploy-cf-with-release.sh.gpg)
1. [Deploy CF - Full](scripts/02-deploy-cf-full.sh.gpg)
1. [Deploy Redis - With release](scripts/03-deploy-redis-with-release.sh.gpg)
1. [Deploy Redis - Full](scripts/03-deploy-redis-full.sh.gpg)
