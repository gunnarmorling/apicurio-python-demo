# Apicurio Python Demo

Shows how to use the Apicurio schema registry with the Confluent Kafka Python client.

Get the confluent-kafka-python repo with some examples. The producer.py file needs a patch:

```
git clone https://github.com/confluentinc/confluent-kafka-python.git
cd confluent-kafka-python && git apply ../serializer.patch && cd ..
```

Build this demo and get a shell in the `python` container:

```
docker-compose up --build
docker-compose run --rm python
```

In the container run this:

```
# Produce and consume some records
cd /opt/apicurio-python-demo/confluent-kafka-python/examples
python avro_producer.py -b kafka:9092 -s http://apicurio:8080/apis/ccompat/v6/ -t test
python avro_consumer.py -b kafka:9092 -s http://18.246.21.110:8080/apis/ccompat/v6/ -t test

# Get the auto-registered schema from the registry
http apicurio:8080/apis/ccompat/v6/subjects/test-value/versions/1
```
