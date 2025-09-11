# DevOps CI/CD Pipeline – Node.js App

## Architecture Diagram
          ┌─────────────┐
          │  GitHub     │
          │ (Node.js    │
          │  project)   │
          └─────┬──────┘
                │  Code Push
                ▼
          ┌─────────────┐
          │  Jenkins    │
          │  Pipeline   │
          │  (CI/CD)    │
          └─────┬──────┘
                │ Build & Test
                ▼
          ┌─────────────┐
          │   Docker    │
          │  Build &    │
          │ Push to DH  │
          └─────┬──────┘
                │ Image Push
                ▼
          ┌─────────────┐
          │ AWS ECS     │
          │ Cluster     │
          │ (Fargate)   │
          └─────┬──────┘
                │ Deploy Container
                ▼
          ┌─────────────┐
          │  Public IP  │
          │  Application│
          └─────────────┘

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

**Explanation:**

Developer pushes Node.js code to GitHub.

Jenkins pipeline triggers automatically:

Checks out code

Installs dependencies and runs tests

Builds Docker image

Pushes Docker image to Docker Hub

AWS ECS Fargate pulls the latest Docker image and runs the container.

The application is accessible via the public IP of the ECS task.

