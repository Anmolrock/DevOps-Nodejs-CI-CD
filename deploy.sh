#!/bin/bash
CLUSTER_NAME="devops-cluster"
SERVICE_NAME="devops-service"
AWS_REGION="us-east-1"
IMAGE_NAME="anmol792/devops-nodejs"
IMAGE_TAG="$BUILD_NUMBER"
IMAGE_URI="${IMAGE_NAME}:${IMAGE_TAG}"

aws ecs update-service \
    --cluster ${CLUSTER_NAME} \
    --service ${SERVICE_NAME} \
    --force-new-deployment \
    --region ${AWS_REGION}

echo "Deployment triggered using image ${IMAGE_URI}"
