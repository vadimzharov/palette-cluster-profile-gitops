## Manage K8S clusters using GitOps and Palette

To test without installing/configuring TF set bash alias

alias terraform='docker run --rm -it -w $PWD -v $PWD:$PWD hashicorp/terraform:latest'