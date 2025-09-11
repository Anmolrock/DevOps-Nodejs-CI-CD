# DevOps CI/CD Pipeline – Node.js App

## Architecture Diagram
<img width="1536" height="1024" alt="diagram" src="https://github.com/user-attachments/assets/8b96ed30-df6b-4b77-a8bd-29c6a47563d6" />


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

🛠 Tools & Services Used

Node.js / Express.js → Application development

Docker → Containerization

DockerHub → Image registry

Jenkins → CI/CD automation

AWS ECS (Elastic Container Service) → Deployment & container orchestration

AWS EC2 / Fargate → Compute platform

GitHub → Source code repository

## Setup Instructions
1. Clone repository.
2. Configure Jenkins with credentials.
3. Setup webhook.
4. Run pipeline.

📂 Repository Structure
├── Architecture-Diagram/       # System design & workflow
├── Deployment-Proof.pdf        # Screenshots of working deployment
├── Dockerfile                  # Docker image definition
├── Jenkinsfile                 # Jenkins pipeline for CI/CD
├── README.md                   # Setup & deployment guide (this file)
├── WRITEUP.md                  # Challenges, learnings & improvements
├── app.js                      # Node.js Express app
├── deploy.sh                   # Deployment script to ECS
├── logoswayatt.png             # App asset/logo
├── package.json                # Node.js dependencies
├── package-lock.json

## Pipeline Flow
1. Checkout code.
2. Install dependencies & test.
3. Build Docker image.
4. Push to DockerHub.
5. Deploy to AWS ECS.

## Monitoring
Logs can be viewed in AWS CloudWatch → Log groups → devops-service.

💡 Possible Improvements

Add Terraform/CloudFormation for infra as code (instead of manual ECS setup)

Use SonarQube + Trivy for code & image scanning in pipeline

Add Prometheus + Grafana monitoring

Automate rollbacks with Blue/Green or Canary deployments

Enable HTTPS with AWS ALB + ACM

🚧 Challenges & Solutions
Challenge	Solution
Integrating Jenkins with DockerHub	Configured Jenkins credentials & used docker login within pipeline
ECS service not updating	Added deploy.sh with aws ecs update-service --force-new-deployment
Docker image size large	Used lightweight Node.js base image (node:alpine)
Managing secrets (AWS keys, DockerHub)	Stored securely in Jenkins credentials manager

**Explanation:**

Developer pushes Node.js code to GitHub.

Jenkins pipeline triggers automatically:

Checks out code

Installs dependencies and runs tests

Builds Docker image

Pushes Docker image to Docker Hub

AWS ECS Fargate pulls the latest Docker image and runs the container.

The application is accessible via the public IP of the ECS task.

👨‍💻 Author: Anmolrock

