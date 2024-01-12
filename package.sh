#!/bin/bash
set -x
rm $(pwd)/atm0s-media-stack-*.tgz
helm package "$(pwd)"/.
helm repo index --url https://8xff.github.io/helm/ --merge index.yaml .