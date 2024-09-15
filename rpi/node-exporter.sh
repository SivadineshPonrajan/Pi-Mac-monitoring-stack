docker run -d \
  --name=node_exporter \
  --network=host \
  --pid=host \
  prom/node-exporter:latest