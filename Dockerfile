ARG STRIMZI_VERSION=0.41.0
ARG KAFKA_VERSION=3.7.0

FROM quay.io/strimzi/kafka:${STRIMZI_VERSION}-kafka-${KAFKA_VERSION}
USER root:root
COPY ./plugins/ /opt/kafka/plugins/

USER 1001