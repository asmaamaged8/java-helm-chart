pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                git 'https://github.com/asmaamaged8/java-helm-chart.git'
                sh "docker build -t java:$BUILD_TAG ."
            }
            post {
                success { 
                    sh "docker image ls"
                }
            }
        }
    }
}
