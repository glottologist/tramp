# Kafka Dev Environment

## Starting Environment

Use docker compose to bring the environment up:

```
docker-compose up
```

You can also, run as daemon

``` 
docker-compose -d up
```

## Kafka Manager

Kafka manager url is available to view status of the kafka cluster.

1. Navigate to http://localhost:9000
2. Select Cluster -> Add Cluster from the UI menu
3. Add Cluster Name
4. Enter Zookeeper hosts as ```zookeeper:2181```.  This is using the docker internal DNS
5. Tick, ```Enable JMX Polling```
6. Hit the ```Save``` button at the bottom of the page

Kafka manager allows you to see statistics of the cluster including number of brokers and topics etc.

## Prometheus

Prometheus is a time series monitoring/collection system.  

A UI is available at http://localhost:9090

## Grafana

Grafana allows you to visualize the metrics collected from prometheus. 

The UI is available at http://localhost:3000

user:admin
password:admin

To enable the Kafka monitoring: 

1. From the top-left icon menu, select data sources.
2. Add data source
3. 1. Name ~ Kafka
   1. Type = Prometheus
   2. url = http://prometheus:9090
   3. Access = proxy
4. Save & Test => You should see s ```Success Datasource is working``` message
5. Select the ```Dashboards``` tab
6. Click Import to get standard Prometheus metrics Dashboard
7. From the top-left icon menu, select Dashboards => Import
8. Select ```Choose file``` and then navigate to this directory and select the ```Kafka.json``` file for importing



