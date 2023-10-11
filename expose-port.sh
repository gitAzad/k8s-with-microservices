#!/bin/bash

# Replace these with the service names you've defined in your YAML
SERVICES=("serv1-service" "serv2-service" "serv3-service")
PORTS=("8081:8081" "8082:8082" "8083:8083")

for i in "${!SERVICES[@]}"; do
  kubectl port-forward service/${SERVICES[$i]} ${PORTS[$i]} &
done

# Wait for a few seconds to allow port-forwarding to start
sleep 5

# Use 'wait' to ensure that the background processes are completed
wait
