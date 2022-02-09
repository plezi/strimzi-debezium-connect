# Strimzi Kafka Connect Debezium

The goal here is to use the official Strimzi Kafka docker image and add debezium plugins.

## Sync plugins

The `./sync-plugins.sh` script is used to fetch and download debezium plugins into `./plugins`.
They are then copied into `/opt/kafka/plugins/` within the strimzi kafka image.

The version specified in the one of Debezium.

```bash
./sync-plugins.sh
# with version override
./sync-plugins.sh 1.8.0.Final
```

## Build image

```bash
docker build -t ghcr.io/plezi/ --build-arg STRIMZI-VERSION="0.27.1" --build-arg KAFKA-VERSION="2.8.0" .
```
