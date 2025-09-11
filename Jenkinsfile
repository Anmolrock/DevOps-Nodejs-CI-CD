pipeline{
    agent any
    
    environment{
        REGISTRY = 'anmol792/devops-nodejs'
        IMAGE_TAG = "${env.BUILD_NUMBER}"
    }
    
    stages{
        stage('Code-Checkout'){
            steps{
                git branch: 'dev', url: 'https://github.com/Anmolrock/devops-nodejs-ci-cd.git'
            }
        }
        
        stage('Build the Code'){
            steps{
            sh 'node -v'
            sh 'npm -v'
            sh 'npm install'
            sh 'npm test'
                }
            }
        stage('Dockerize an Application'){
            steps{
                script{
                    docker.build("${env.REGISTRY}:${env.IMAGE_TAG}")
                }
            }
        }
        
        stage('Push to DockerHub Registry'){
            steps{
                script{
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image("${REGISTRY}:${IMAGE_TAG}").push()
                    }
                }
            }
        }
        
        stage('Deploy to AWS ECS'){
            steps{
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }
}
