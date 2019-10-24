# KnowHub Certificate Issuer

## Prerequisites
### Helm
Install [Helm](https://medium.com/google-cloud/install-secure-helm-in-gke-254d520061f7)

### Cert Manager
Install [cert manager](https://docs.cert-manager.io/en/latest/getting-started/install/kubernetes.html)

## Service account
* `gcloud iam service-accounts create dns01-solver`
* `gcloud iam service-accounts keys create key.json --iam-account dns01-solver@$PROJECT_ID.iam.gserviceaccount.com`
* `kubectl create secret generic clouddns-dns01-solver-svc-acct --from-file=key.json -n cert-manager`
* Go to IAM & Admin and assign the service account the role of DNS Administrator

Other details [here](https://cert-manager.readthedocs.io/en/latest/tasks/issuers/setup-acme/dns01/google.html).

## Installation
`helm install --name knowhub-cert-issuer --tls .`
Note that the namespace is not declared on purpose.