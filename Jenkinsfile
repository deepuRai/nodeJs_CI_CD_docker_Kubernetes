pipeline {
    agent any
 
    tools {nodejs "node"}
 
    stages {
 
        stage('Cloning Git') {
            steps {
                git url:'https://github.com/deepuRai/nodeJs_CI_CD_docker_Kubernetes.git',
                    branch:'main'
            }
        }
        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }
 
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
}
    
}

