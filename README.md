# Strimzi Kafka Connect Debezium

This project aim to use the official [Strimzi](https://strimzi.io/) Kafka docker image and add [Debezium](https://debezium.io/) plugins.

## Sync plugins

The `./sync-plugins.sh` script is used to fetch and download [Debezium plugins](https://repo1.maven.org/maven2/io/debezium/) into `./plugins`.
They are then copied into `/opt/kafka/plugins/` on Docker build.

The version specified in the one of Debezium.

```bash
./sync-plugins.sh

# with version override
./sync-plugins.sh 2.1.2.Final
```

## Build image

```bash
docker build -t ghcr.io/plezi/strimzi-debezium-connect --build-arg STRIMZI_VERSION="0.31.0" --build-arg KAFKA_VERSION="3.2.1" .
```

### Resources

- [Deploying Debezium using the new KafkaConnector resource](https://strimzi.io/blog/2020/01/27/deploying-debezium-with-kafkaconnector-resource/)
- [Building your own Kafka Connect image with a custom resource](https://strimzi.io/blog/2021/03/29/connector-build/)
- [Strimzi Docs](https://strimzi.io/docs/operators/latest/full/using.html#assembly-kafka-connect-str)
