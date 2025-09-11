# DevOps CI/CD Pipeline – Node.js App

## Architecture Diagram
![Architecture](docs/architecture.png)

## Tools Used
- AWS ECS
- Docker
- Jenkins
- GitHub
- Node.js
- CloudWatch

## Setup Instructions
1. Clone repository.
2. Configure Jenkins with credentials.
3. Setup webhook.
4. Run pipeline.

## Pipeline Flow
1. Checkout code.
2. Install dependencies & test.
3. Build Docker image.
4. Push to DockerHub.
5. Deploy to AWS ECS.

## Monitoring
Logs can be viewed in AWS CloudWatch → Log groups → devops-service.
