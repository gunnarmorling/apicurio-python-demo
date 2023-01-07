FROM python:3-bullseye

RUN apt-get update && apt-get install httpie;

# compile and install librdkafka; the version available in Debezium is too old
RUN set -ex; \
  git clone https://github.com/edenhill/librdkafka && \
  cd librdkafka && git checkout v1.9.2 && ./configure && make && make install && ldconfig

RUN pip install confluent-kafka six fastavro requests;
