#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

version="3.0.2.Final"
plugins=("debezium-connector-mongodb" "debezium-connector-postgres")

if [[ "$#" -gt 0 ]]; then
  version="$1"
fi

echo "Cleaning ./plugins/"
rm -fr ./plugins/*

for plugin in "${plugins[@]}"; do
  repo="https://repo1.maven.org/maven2/io/debezium/$plugin/$version/$plugin-$version-plugin.tar.gz"
  path="./plugins"

  echo "Downloading plugin : $repo"
  wget -c "$repo" -O - | tar xz -C "$path"

  echo "Plugin extracted here : $path"
done
