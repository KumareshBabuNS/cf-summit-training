# Review notes on training content

## 1. Bosh Basics - [Labs](https://content.staging.enablement.pivotal.io/public/cf-oss-training/operator/site/labs/deploy-cf/index.html)

### Deploying Cloud Foundry to bosh-lite

* Says "**TO DO Need resources:** - cf-release (compile package) - stemcells - Manifest"
	* What cf-release, stemcell and Manifest should we use?
* Says "Your goal is to use what you learned in the previous module to deploy Cloud Foundry to your running bosh-lite instance."
	* What previous module? Does this refer to the slides?

### Preparing for deployment

* Says: "These have been provided for you in the `resources` directory."
	* I cannot find the mentioned directory in the provided bosh-lite AMI.

## 2. Bosh Clusters & Availability - [Labs](https://content.staging.enablement.pivotal.io/public/cf-oss-training/operator/site/labs/bosh-ha/index.html)

### Health Monitoring

1. Says: "`monit summary`"
  a. Monit was not found on VM:
     ```
     /var/vcap$ monit summary
	 -bash: monit: command not found
     ```

#### VM Resurrection

* Says: "*Automatic Resurrection* > TO DO: update script location"
	* Who is to provide this script?

## 3. CF Basics - [Labs](https://content.staging.enablement.pivotal.io/public/cf-oss-training/operator/site/labs/cf-basics)

### Pushing your First App

* Says: "Now push the included sample app: **TO DO**"
  * Who is to provide the sample app?

## 4. Data services & the marketplace - [Labs](https://content.staging.enablement.pivotal.io/public/cf-oss-training/operator/site/labs/services)

### Deploying Redis

* Says: "A deployment manifest and release is provided in the resources directory **TO DO**"
	* Who is to provide the release and manifest?

## 5. Scaling - [Labs](https://content.staging.enablement.pivotal.io/public/cf-oss-training/operator/site/labs/scaling)

### Scaling the Platform Out

* Says: "Edit your deployment manifest (in the **TO DO** resources directory)."
	* I guess this will be solved when manifest in *1. Bosh Basics - Deploying Cloud Foundry* is provided
* Says: "Find the **TO DO** runner instance and increase the number to 2"
  * This will be solved also along the previous point.

## 6. Upgrade - [Labs](https://content.staging.enablement.pivotal.io/public/cf-oss-training/operator/site/labs/upgrading)

### Updating the stemcell

* Says: "An updated stemcell is included in the resources/upgrading directory **TO DO**."
  * Who is to provide the stemcell?
