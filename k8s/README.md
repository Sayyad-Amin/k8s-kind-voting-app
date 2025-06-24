# Kubernetes Voting Application

This directory contains Kubernetes manifests for deploying a simple voting application.

## Components

- **vote**: A Python web app that lets you vote between two options
- **redis**: A Redis queue that collects new votes
- **worker**: A .NET worker that consumes votes from Redis and stores them in Postgres
- **db**: A Postgres database that stores the votes
- **result**: A Node.js web app that shows the results of the voting in real time

## Deployment Instructions

1. Create the namespace and deploy all components:

```bash
kubectl apply -f 00-namespace.yaml
kubectl apply -f 01-vote-deployment.yaml
kubectl apply -f 02-vote-service.yaml
kubectl apply -f 03-redis-deployment.yaml
kubectl apply -f 04-redis-service.yaml
kubectl apply -f 05-db-deployment.yaml
kubectl apply -f 06-db-service.yaml
kubectl apply -f 07-db-init-job.yaml
kubectl apply -f 08-worker-deployment.yaml
kubectl apply -f 09-result-deployment.yaml
kubectl apply -f 10-result-service.yaml
```

Or apply all at once:

```bash
kubectl apply -f .
```

2. Set up port-forwarding to access the applications:

```bash
# Forward the vote app to localhost:5000
kubectl port-forward -n voting-app svc/vote 5000:80 --address 0.0.0.0

# Forward the result app to localhost:5001
kubectl port-forward -n voting-app svc/result 5001:80 --address 0.0.0.0
```

3. Access the applications:
   - Voting interface: http://localhost:5000
   - Results interface: http://localhost:5001

## Important Notes

- The result app runs on port 4000 internally, but the service maps it to port 80
- The database requires initialization with the "votes" table, which is handled by the db-init job
- For production use, consider using Secrets for database credentials instead of environment variables
