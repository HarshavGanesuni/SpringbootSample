pipeline {
    agent any
    tools {
        maven 'maven-3.9.9'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/HarshavGanesuni/SpringbootSample.git'
                }
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
	}
}