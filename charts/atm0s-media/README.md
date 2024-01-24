# Atm0s Media Server Stack

Atm0s Media Stack Helm chart for Kubernetes

## Introduction

Atm0s Media Stack installs the following

- Atm0s pods: Gateway, Connector, Webrtc, RTMP, Token Generator
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

## Securing the cluster

To communicate with the cluster or adding a new node, you will need to be authenticated with the right token. The token can be derive with the right secret. By default, in non-secure mode, the cluster is initialized with secret key: `insecure`. To use your own secret, enable `secure` 
and update the secret to your own secret. This will setup a `token-generator` node.

### Generating JWT Session Token

To generate a token for streaming, you need to make a request to the token-generator node through `http(s)://your_host/auth/`.
You can check out available authentication endpoints for each feature using swagger in `https(s)://your-host/auth/ui/`.
Note that due to URL rewrite, these endpoints will need the be prefixed with `/auth` to be able to work properly.

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

## Server Usage

The gateway can be connected under the `/gateway/`, so your server URL should be: `http://your_host/gateway` 

For more details: https://github.com/8xFF/atm0s-media-server