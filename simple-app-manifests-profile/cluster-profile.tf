# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

resource "spectrocloud_cluster_profile" "simple-app" {

  name        = "simple-app-tf"
  description = "A basic cluster profile to deploy simple app"
  tags        = concat(["managed-by:tf", "repository-on:github"])
  cloud       = "all"
  type        = "add-on"
  version     = "1.0.1"

  pack {
    name = "manifest-namespace"
    type = "manifest"
    manifest {
      name    = "manifest-namespace"
      content = file("${path.cwd}/manifests/namespace.yaml")
    }
    manifest {
      name    = "manifest-deployment"
      content = file("${path.cwd}/manifests/deployment.yaml")
    }
    manifest {
      name    = "manifest-secret"
      content = file("${path.cwd}/manifests/secret.yaml")
    }
  }
}

