#!/bin/bash
kubectl port-forward --address 0.0.0.0 service/vote -n voting-app 5000:80 &
kubectl port-forward --address 0.0.0.0 service/result -n voting-app 5001:80 &
echo "Port forwarding set up. Press Ctrl+C to stop."
wait
