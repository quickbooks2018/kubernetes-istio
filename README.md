# ISTIO

- Sample Repo https://github.com/DickChesterwood/istio-fleetman.git

- Istioctl Installation
```istio
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.18.1
ls
cd bin
ls
cp istioctl /usr/local/bin
```
- https://istio.io/latest/docs/setup/install/istioctl/

- Istioctl Adds Installation
```istio
cd istio-1.18.1 && samples/addons
kubectl apply -f .
```

- Istioctl Verify Installation
```istio
istioctl verify-install
```

### Helm Installation

- https://istio.io/latest/docs/setup/install/helm/

- Istio Base

- helm repo add istio https://istio-release.storage.googleapis.com/charts

- helm repo update

- helm search repo istio/base

- helm search repo istio/base --versions

- helm show values istio/base --version 1.18.1 > istio-base-values.yaml


```helm
helm upgrade --install istio-base-release -n istio-system --create-namespace --version 1.18.1 istio/base --set global.istioNamespace=istio-system --wait
```

- Istiod

- helm repo add istio https://istio-release.storage.googleapis.com/charts

- helm search repo istio/istiod

- helm repo update

- helm search repo istio/istiod --versions
  
- helm show values istio/istiod --version 1.18.1 > istio-istiod-values.yaml

```helm
helm upgrade --install istiod-release -n istio-system --create-namespace --version 1.18.1 istio/istiod --set telemetry.enabled=true --set global.istioNamespace=istio-system --wait
```

```helm
helm upgrade --install gateway -n istio-ingress --create-namespace istio/gateway --version 1.18.1 --wait
```

- Label the namespace

```kubectl
kubectl label namespace default istio-injection=enabled
```

- Delete the Istio Label

```
kubectl label namespace default istio-injection-
```

- Vault Istio Combine (this Annotaion will fix it) 1.18.1 Istio
```bash
vault.hashicorp.com/agent-init-first: 'true'
```
