#!/bin/bash
set -x
rm $(pwd)/atm0s-media-stack-*.tgz
sed -i -e "s/^version.*/version: $(cat VERSION)/" -e "s/^appVersion.*/appVersion: $(cat VERSION)/" $(pwd)/Chart.yaml
sed -i "s/tag:.*/tag: $(cat VERSION)/" "$(pwd)"/values.yaml
helm package "$(pwd)"/.
helm repo index --url https://8xff.github.io/helm/ --merge index.yaml .