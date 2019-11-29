#!/bin/bash
echo "Dropping previous containers"
docker-compose down
echo "Spinning up containers"
docker-compose up -d --force-recreate
echo "Opening UI tabs"
xdg-open http://localhost:8000/  # Kafka Topics UI 
xdg-open http://localhost:8001/  # Schema Registry UI
xdg-open http://localhost:8003/  # Kafka Connect UI
xdg-open http://localhost:8004/  # ZooNavigator 
xdg-open http://localhost:3000/  # Grafana
xdg-open http://localhost:9090/  # Prometheus
xdg-open http://localhost:19000/ # Kafka Manager

docker run --net=host --interactive --tty confluentinc/cp-ksql-cli:5.3.1 http://localhost:8088