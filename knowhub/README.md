# KnowHub

## Prerequisites
### Helm
Install [Helm](https://medium.com/google-cloud/install-secure-helm-in-gke-254d520061f7)
## DNS
### Gateway static IP
Set a regional static IP for Istio ingress gateway. These steps may have already been performed if this is not the first env to be deployed on the cluster.

* Find the external IP of the ingress gateway:  
`k get svc -n istio-system -l istio=ingressgateway`

* Go to VPC Network -> External IP addresses, find the ingress gateway IP and set it static.

### DNS routes
* Go to Network Services -> Cloud DNS and create a new zone (e.g. knowhub.it).

* In the zones menu, enable DNSSEC for the new zone and follow the instructions to set required params to the domain registrar.

* \[DEV/TEST ENV ONLY] Add DNS records to point the domain to the ingress gateway IP.
  * `<<envName>>.<<domain>>`

* \[PROD ENV ONLY] Add DNS records to point the domain to the ingress gateway IP.
  * `<<domain>>`
  * `www.<<domain>>`

## Namespace setup
* Create a namespace named knowhub-<<envName>>.

* Add a label to enable Istio sidecar injection:  
`kubectl label namespace <<envName>> istio-injection=enabled`

## Installation
`helm install --name knowhub-<<envName>> --tls --namespace knowhub-<<envName>> .`

## Upgrade
`helm upgrade knowhub-<<envName>> --tls -f envConfiguration/<<envName>>.yaml .`

## CDN
Enable Cloud CDN on the cluster project as detailed [here](https://cloud.google.com/cdn/docs/using-cdn).