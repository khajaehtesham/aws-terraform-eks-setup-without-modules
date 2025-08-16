#!/bin/bash

# reference link used - https://secrets-store-csi-driver.sigs.k8s.io/getting-started/installation

set -x 

helm repo add secrets-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts
helm install csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver --namespace kube-system

# helm install csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver --namespace kube-system --set syncSecret.enabled=true --set enableSecretRotation=true

# To enable secret rotation, you need to set the following values in the Helm chart:

#    Feature                           Helm Chart Values
# Sync as Kubernetes secret	       syncSecret.enabled=true
# Secret Auto rotation	           enableSecretRotation=true

helm repo add aws-secrets-manager https://aws.github.io/secrets-store-csi-driver-provider-aws
helm install -n kube-system secrets-provider-aws aws-secrets-manager/secrets-store-csi-driver-provider-aws

