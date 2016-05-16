# Supporting scripts/resources

* Latest stemcell: https://s3.amazonaws.com/bosh-warden-stemcells/bosh-stemcell-3147-warden-boshlite-ubuntu-trusty-go_agent.tgz

### Deploying CF

```
mkdir workspace
cd workspace
git clone https://github.com/cloudfoundry/cf-release.git
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source /home/ubuntu/.rvm/scripts/rvm
wget https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.7/spiff_linux_amd64
chmod +x spiff_linux_amd64
sudo mv spiff_linux_amd64 /usr/local/bin/spiff
rvm install ruby-2.3.0
# Fix for RVM root .gem dir
sudo chown ubuntu:ubuntu ~/.gem -R
gem install bundler
gem install bosh_cli

cat > aws_stub.yml <<EOL
---
properties:
  domain: 52.90.173.128.xip.io
EOL

cd cf-release
./scripts/update
export BOSH_USER=admin
export BOSH_PASSWORD=admin
bosh target 52.90.173.128 lite
bosh upload stemcell https://s3.amazonaws.com/bosh-warden-stemcells/bosh-stemcell-3147-warden-boshlite-ubuntu-trusty-go_agent.tgz
bosh create release
bosh upload release
scripts/generate-bosh-lite-dev-manifest ../aws_stub.yml
bosh deploy
```

### Deploying Redis

***WARNING***
The following code will fail, seems there is an issue with the BOSH release.
Already reported in https://github.com/cloudfoundry-community/redis-boshrelease/issues/25

```
bosh upload release https://bosh.io/d/github.com/cloudfoundry-community/redis-boshrelease
git clone https://github.com/cloudfoundry-community/redis-boshrelease.git
cd redis-boshrelease
templates/make_manifest warden
bosh -n deploy
```
