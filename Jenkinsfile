pipeline {
 
    environment {
        registry = "raideepu/nodejs_test_docker_kubernetes"
        
    registryCredential = 'dockerhub'
    dockerImage = '' 
    }
 
 
    agent any
 
    tools {nodejs "node"}
 
    stages {
 
          stage('Cloning Git') {
            steps {
                git url:'https://github.com/deepuRai/nodeJs_CI_CD_docker_Kubernetes.git',
                    branch:'main'
            }
        }
 
        stage('Install Node.js dependencies') {
            steps {
                sh 'npm install'
            }
        }
 
        stage('Test App') {
            steps {
                sh 'npm test'
            }
        }
 
        stage('Build image') {
          steps{
            script  {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
          }
        }
 
        stage('Deploy Image') {
  steps{    script {
      docker.withRegistry( '', registryCredential ) {
        dockerImage.push()
      }
    }
  }
}

stage('Remove Unused docker image') {
  steps{
    sh "docker rmi $registry:$BUILD_NUMBER"
  }
}
 
        
    }
}
