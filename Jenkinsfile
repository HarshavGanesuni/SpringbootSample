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
        stage('PUSH TO ECR'){
        script{
       sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 980889732995.dkr.ecr.us-east-1.amazonaws.com
       docker build -t springdemo .
       docker tag springdemo:latest 980889732995.dkr.ecr.us-east-1.amazonaws.com/springdemo:latest
       docker push 980889732995.dkr.ecr.us-east-1.amazonaws.com/springdemo:latest'
       }
       }
	}
}