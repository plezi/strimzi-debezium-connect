ARG STRIMZI_VERSION=0.31.0
ARG KAFKA_VERSION=3.2.1

FROM quay.io/strimzi/kafka:${STRIMZI_VERSION}-kafka-${KAFKA_VERSION}
USER root:root
COPY ./plugins/ /opt/kafka/plugins/

USER 1001