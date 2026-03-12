#!/bin/bash
set -e

kubectl create namespace argocd || true

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl rollout status deployment argocd-server -n argocd

echo "ArgoCD admin password:"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

echo ""
echo "Access UI:"
echo "kubectl port-forward svc/argocd-server -n argocd 8080:443"
