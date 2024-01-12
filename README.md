# Atm0s Media Server Stack 

Atm0s Media Stack Helm chart for Kubernetes

## Introduction
Atm0s Media Stack installs the following
- Atm0s pods: Gateway, Connector, Webrtc, RTMP, SIP
- Nats pod

## Prerequisites
- **Kubernetes >= 1.23** (You must have a Kubernetes cluster installed and be able to access it with kubectl.)
- **Helm v3** (https://helm.sh/docs/intro/install/)

## Installing the Chart
Add the 8xFF repository to Helm:
```shell script
helm repo add atm0s https://8xff.github.io/helm
helm repo update
helm install atm0s-media-stack 8xff/atm0s-media-stack --set gateway.host={host}.{example.com} --namespace atm0s-media --create-namespace
```

## Uninstalling the Chart
```sh
helm delete atm0s-media-stack -n atm0s-media
```

## Example Usage
```
helm install atm0s-media-stack 8xff/atm0s-media-stack --set gateway.host=gateway.example.com --namespace atm0s-media --create-namespace
```