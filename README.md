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
# Setup Instructions
Setup Jenkins

Create a new pipeline job.

Add Docker Hub and AWS credentials.

Install and configure NodeJS 18 plugin.



3. Configure AWS ECS

Create a cluster devops-cluster.

Create a task definition devops-task.

Setup log group /ecs/devops-task in CloudWatch.

Assign ecsTaskExecutionRole IAM permissions.



4. Run Jenkins Pipeline

Build, test, dockerize, and deploy the application.



5. Access the Application

Use the ECS public IP (from ENI) and port 3000 to view the app.

🚀 Pipeline Flow Explanation

1. Code Checkout

Jenkins pulls source code from GitHub’s dev branch.

2. Build

Runs npm install and npm test.

3. Dockerize

Builds a Docker image for the application.

4. Push Image

Uploads the image to Docker Hub.

5. Deploy

Updates AWS ECS service with the latest image.

Logs are sent to AWS CloudWatch for monitoring.

📂 Folder Structure

devops-nodejs-ci-cd/
├── README.md
├── Dockerfile
├── deploy.sh
├── app.js
├── package.json
├── package-lock.json
└── images/
    └── architecture-diagram.png

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

