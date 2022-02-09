ARG STRIMZI_VERSION=0.27.1
ARG KAFKA_VERSION=2.8.0

FROM quay.io/strimzi/kafka:${STRIMZI_VERSION}-kafka-${KAFKA_VERSION}
USER root:root
COPY ./plugins/ /opt/kafka/plugins/

USER 1001