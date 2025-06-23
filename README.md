# Voting Application

This is a simple voting application that consists of:
- A frontend voting app written in Python (Flask)
- A Redis queue to collect votes
- A .NET worker to process votes
- A Postgres database to store votes
- A Node.js web app to show results

## Running with Docker Compose

1. Make sure you have Docker and Docker Compose installed:
```
sudo apt-get update
sudo apt-get install docker.io docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
```

2. Clone this repository and navigate to the project directory:
```
cd k8s-kind-voting-app
```

3. Build and start the application:
```
docker-compose up -d
```

4. Access the application:
   - Voting interface: http://localhost:5000
   - Results interface: http://localhost:5001

5. To stop the application:
```
docker-compose down
```

## Architecture

- **vote**: A Python web app that lets you vote between two options
- **redis**: A Redis queue that collects new votes
- **worker**: A .NET worker that consumes votes from Redis and stores them in Postgres
- **db**: A Postgres database that stores the votes
- **result**: A Node.js web app that shows the results of the voting in real time

## Notes for EC2 Deployment

When deploying on an EC2 instance, make sure to:
1. Open ports 5000 and 5001 in your security group
2. Use the public IP address of your EC2 instance to access the application
3. Install Docker and Docker Compose as mentioned above
