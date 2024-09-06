# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

resource "spectrocloud_cluster_profile" "edge-cluster-profile" {

  name        = "k8s-cluster-tf"
  description = "A basic Edge cluster profile managed by TF"
  tags        = concat(["managed-by:tf", "repository-on:github"])
  cloud       = "edge-native"
  type        = "cluster"
  version     = "1.0.0"

  pack {
    name = "edge-native-byoi"
    tag = data.spectrocloud_pack.edge-native-byoi.version
    uid = data.spectrocloud_pack.edge-native-byoi.id
    values = file("${path.cwd}/values/edge-byos.yaml")

  }

  pack {
    name = "edge-k8s"
    tag = data.spectrocloud_pack.edge-k8s.version
    uid = data.spectrocloud_pack.edge-k8s.id
    values = file("${path.cwd}/values/edge-k8s.yaml")

    }

  pack {
    name = "cni-calico"
    tag = data.spectrocloud_pack.cni-calico.version
    uid = data.spectrocloud_pack.cni-calico.id
    values = file("${path.cwd}/values/cni-calico.yaml")
    }

}

data "spectrocloud_pack" "edge-native-byoi" {
  name    = "edge-native-byoi"
  version = "1.0.0"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "edge-k8s" {
  name    = "edge-k8s"
  version = "1.28.9"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "cni-calico" {
  name    = "cni-calico"
  version = "3.26.3"
  registry_uid = data.spectrocloud_registry.public_registry.id
}


data "spectrocloud_registry" "public_registry" {
  name = "Public Repo"
}

