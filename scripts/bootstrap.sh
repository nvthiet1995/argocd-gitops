#!/bin/bash
set -e

kubectl apply -f clusters/thiet_nonprod/gitops/app-of-apps/root-app.yaml

echo "ArgoCD GitOps bootstrapped"
