pipeline {
    agent any
    tools {
        maven 'maven-3.9.9'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    git branch: 'ecr', url: 'https://github.com/HarshavGanesuni/SpringbootSample.git'
                }
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
         stage('PUSH TO ECR') {
           steps {
               script {
                 withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials']])
                   // Authenticate Docker with AWS ECR
                   sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 980889732995.dkr.ecr.us-east-1.amazonaws.com'
                  // Build Docker image
                   sh 'docker build -t springdemo . '
                   // Tag Docker image
                   sh 'docker tag springdemo:latest 980889732995.dkr.ecr.us-east-1.amazonaws.com/springdemo:latest '


                   // Push Docker image to ECR
                   sh ' docker push 980889732995.dkr.ecr.us-east-1.amazonaws.com/springdemo:latest '
                  }
           }
       }

	}
}