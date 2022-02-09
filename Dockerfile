ARG STRIMZI-VERSION=0.27.1
ARG KAFKA-VERSION=2.8.0

FROM quay.io/strimzi/kafka:${STRIMZI-VERSION}-kafka-${KAFKA-VERSION}
USER root:root
COPY ./plugins/ /opt/kafka/plugins/

USER 1001