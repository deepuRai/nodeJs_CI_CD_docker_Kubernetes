pipeline {
 
    environment {
        registry = "raideepu/nodejs_test_docker_kubernetes"
    registryCredential = ‘dockerhub’
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
          docker.build registry + ":$BUILD_NUMBER"
        }
          }
        }
 
        stage('Test image') {
            steps {
                sh 'docker run -i ' + dockerhuburl + ':$BUILD_NUMBER npm test'
            }
        }
 
        stage('Deploy image') {
          steps{
            script {
              docker.withRegistry(dockerregistry, dockerhubcrd ) {
                dockerImage.push("${env.BUILD_NUMBER}")
                dockerImage.push("latest")
              }
            }
          }
        }
 
        stage('Remove image') {
          steps{
            sh "docker rmi $dockerhuburl:$BUILD_NUMBER"
          }
        }
    }
}
