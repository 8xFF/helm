#!/bin/bash
set -x
BASE_DIR="$(pwd)"
CHARTS_DIR="$(pwd)/charts"

MEDIA_DIR="$CHARTS_DIR/atm0s-media"

rm $MEDIA_DIR/atm0s-media-stack-*.tgz

cd $MEDIA_DIR && helm package "${MEDIA_DIR}"/.
helm repo index $MEDIA_DIR --url https://8xff.github.io/helm/charts/atm0s-media

helm repo index $BASE_DIR --merge ${MEDIA_DIR}/index.yaml