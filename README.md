# Manage K8S clusters using GitOps and Palette Examples

This repository consists of examples on how to implement GitOps approach to manage Kubernetes clusters using Palette, Terraform and YAML files containing Kubernetes manifests or Spectro pack values. 

Examples, provided in this repo, create two Palette cluster profiles:
* **simple-app-tf** - add-on cluster profile with one simple application based on Kubernetes manifests (namespace, deployment, secret)
* **spectro-dashboard-tf** - add-on cluster profile with Spectro Kubernetes Dashboard application based on Spectro pack.

For each of the listed profiles there is a corresponding GitHub workflow which triggers when users push or merge changes to `main` branch

For the **simple-app-tf** profile Kubernetes manifests stored as YAML files, and for the **spectro-dashboard-tf** profile pack values stored in YAML file. Once users update any of these YAML files, corresponding GitHub workflow triggers and updates cluster profile accordingly.

GitHub workflows stores TF state in S3 object storage, and to access the storage it is using environment variables, stored as GitHub secrets.

## Get Started

Use the following steps to try these examples.

### Pre-requisites

* Fork the repository
* Create GitHub secrets for the repostory:

For Terraform to access S3 object storage:

* AWS_ACCESS_KEY_ID - access key for TF S3 backend
* AWS_SECRET_ACCESS_KEY - secret access key for TF S3 backend
* *optionally, if use on-prem S3 storage like minio* - AWS_S3_ENDPOINT: 'S3 URL'
* BUCKET_TF_STATE: 'Bucket to store TF state'

For Terraform to access Spectro Cloud Palette:

* SC_API_KEY - Spectro Cloud Palette API Key
* SC_PROJECT_NAME Spectro Cloud Palette Project Name

### Steps


