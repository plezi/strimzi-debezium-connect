#!/bin/bash
set -e

echo "Bump VERSION.md"
echo "${1}" > VERSION.md

echo "[DOCKER] Login"
echo "$GITHUB_TOKEN" | docker login ghcr.io -u "$GITHUB_ACTOR" --password-stdin

echo "[INTERNAL] Sync plugins"

./sync-plugins.sh

echo "[DOCKER] Building images"
docker build --cache-from ghcr.io/plezi/strimzi-debezium-connect:latest --build-arg BUILDKIT_INLINE_CACHE=1 -t ghcr.io/plezi/strimzi-debezium-connect:latest -t ghcr.io/plezi/strimzi-debezium-connect:"${1}" .

echo "[DOCKER] Pushing images"
docker push ghcr.io/plezi/strimzi-debezium-connect:latest
docker push ghcr.io/plezi/strimzi-debezium-connect:"${1}"

#if [ "$GITHUB_REF" == 'refs/heads/master' ]; then
#  echo "[KUSTOMIZE] Applying PRD"
#
#  pushd k8s/kustomize/overlays/prod
#  kustomize edit set image ghcr.io/plezi/strimzi-debezium-connect:"${1}"
#  sed -ri "s/^(\s*app.kubernetes.io\/version\s*:\s*).*/\1${1}/" labels-transformers.yml
#  popd
#fi
#
#if [ "$GITHUB_REF" == 'refs/heads/develop' ]; then
#  echo "[KUSTOMIZE] Applying INT"
#
#  pushd k8s/kustomize/overlays/int
#  kustomize edit set image ghcr.io/plezi/strimzi-debezium-connect:"${1}"
#  sed -ri "s/^(\s*app.kubernetes.io\/version\s*:\s*).*/\1${1}/" labels-transformers.yml
#  popd
#fi
