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
