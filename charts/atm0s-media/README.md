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
helm repo add 8xff https://8xff.github.io/helm
helm repo update
helm install atm0s-media-stack 8xff/atm0s-media-stack --set gateway.host={host}.{example.com} --namespace atm0s-media --create-namespace
```

## Installing SSL

By default, a self-singed certificate comes in the Atm0s Media Stack that you install with Helm.

#### Custom Certificate

you can replace it with your own certificate as below.

```sh
kubectl create -n antmedia secret tls ${CERT_NAME} --key ${KEY_FILE} --cert ${CERT_FILE}
```

## Note

You will notice that after the installation, the stack only contains NATS and a Gateway server.
To continue, you need to run curl into the gateway server to get our initial seed address.

```bash
curl http://<YOUR_SERVER_IP>:<YOUR_GATEWAY_HTTP_PORT>/node-info/
```

This resulted in a JSON response, which will contain the seed address in the property "address".
Or you can check the logs produced by the gateway to get the address.
The address will look something like this: 0@/ip4/192.168.65.3/udp/3001/ip4/192.168.65.3/tcp/3001

This seed address are necessary to initialize the Atm0s stack/cluster.

Now you can update the default values.yaml, enable your favorite server to get up an running.

## Uninstalling the Chart

```sh
helm delete atm0s-media-stack -n atm0s-media
```

## Example Usage

```
helm install atm0s-media-stack 8xff/atm0s-media-stack --set gateway.host=gateway.example.com --namespace atm0s-media --create-namespace
```
