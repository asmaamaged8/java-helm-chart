pipeline {
  agent any
    
  stages {
    stage("Clone code from GitHub") {
            steps {
                script {
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GITHUB_CREDENTIALS', url: 'https://github.com/asmaamaged8/java-helm-chart.git']])
                }
            }
        }
     
  
     stage('Build Node JS Docker Image') {
            steps {
                script {
                  sh 'docker build -t asmaamaged/java-1.0 .'
                }
            }
        }


        stage('Deploy Docker Image to DockerHub') {
            steps {
                script {
                 withCredentials([string(credentialsId: 'asmaamaged', variable: 'asmaamaged')]) {
                    sh 'docker login -u asmaamaged -p ${asmaamaged}'
            }
            sh 'docker push asmaamaged/java-1.0'
        }
            }   
        }
         
     stage('Deploying Node App helm chrt on eks') {
      steps {
        script {
          sh ('aws eks update-kubeconfig --name sample --region ap-south-1')
          sh "kubectl get ns"
          sh "helm install java ./java-chart"
        }
      }
    }

  }
}
