# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

resource "spectrocloud_cluster_profile" "spectro-dashboard" {

  name        = "spectro-dashboard-tf"
  description = "A basic cluster profile to deploy Spectro Cloud Dashboard"
  tags        = concat(["managed-by:tf", "repository-on:github"])
  cloud       = "all"
  type        = "add-on"
  version     = "1.0.0"

  pack {
    name = "spectro-k8s-dashboard"
    tag = data.spectrocloud_pack.spectro-k8s-dashboard.version
    uid = data.spectrocloud_pack.spectro-k8s-dashboard.id
    values = file("${path.cwd}/values/spectro-k8s-dashboard.yaml")

  }
}

data "spectrocloud_pack" "spectro-k8s-dashboard" {
  name    = "spectro-k8s-dashboard"
  version = "2.7.1"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_registry" "public_registry" {
  name = "Public Repo"
}