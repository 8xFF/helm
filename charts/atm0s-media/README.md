# Atm0s Media Server Stack

Atm0s Media Stack Helm chart for Kubernetes

## Introduction

Atm0s Media Stack installs the following

- Atm0s pods: Gateway, Connector, Webrtc, RTMP
- Nats pod

## Prerequisites

- **Kubernetes >= 1.23** (You must have a Kubernetes cluster installed and be able to access it with kubectl.)
- **Helm v3** (https://helm.sh/docs/intro/install/)

## Firewall
The containers will be using host's network stacks, so in order for them to communicate properly with each others, you will need to config some of your host firewall rules.

## Installing the Chart

Add the 8xFF repository to Helm:

```shell script
helm repo add 8xff https://8xff.github.io/helm
helm repo update
helm install atm0s-media-stack 8xff/atm0s-media-stack --set gateway.host={host}.{example.com} --namespace atm0s-media --create-namespace
```

## Installing SSL

By default, a self-singed certificate comes with the Atm0s Media Stack.

#### Custom Certificate

you can replace it with your own certificate as below.

```sh
kubectl create -n atm0s-media secret tls ${CERT_NAME} --key ${KEY_FILE} --cert ${CERT_FILE}
```

## Uninstalling the Chart

```sh
helm delete atm0s-media-stack -n atm0s-media
```

## Example Usage

```
helm install atm0s-media-stack 8xff/atm0s-media-stack --set gateway.host=gateway.example.com --namespace atm0s-media --create-namespace
```
