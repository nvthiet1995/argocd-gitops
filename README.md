# install argocd
```sh
cd argocd-gitops/scripts
chmod +x install-argocd.sh
./install-argocd.sh
```

# check argocd status:
```sh
kubectl get pods -n argocd
```

# get password to login argocd-server:

```sh
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```
Run with git bash if not found base64
login:
admin/6DW9BGpZFSUCpw5K

# login to argocd:
Forward port:
```sh
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
Open browser:
https://localhost:8080


# bootstrap gitops:

```sh
./scripts/bootstrap.sh
```

# fix docker image pullbackoff:
```sh
docker pull nginx:1.25-alpine
docker pull oci.external-secrets.io/external-secrets/external-secrets:v0.12.1
```


# check argocd:

```sh
kubectl get applications -n argocd
```


# check CRD external-secrets:
```sh
kubectl get crd | grep external-secrets
```

check apiVersion:
```sh
kubectl get crd externalsecrets.external-secrets.io -o jsonpath='{.spec.versions[*].name}'
```

