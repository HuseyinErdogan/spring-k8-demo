pipeline {
    agent any
    tools{
        maven '3.6.3'
    }
    stages{
        stage('Build Maven'){
            steps{
//                 checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Java-Techie-jt/devops-automation']]])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'ls '
                    sh 'ls target/'
                    sh 'docker --version'
                    sh 'docker build -t huserd/spring-k8-demo:2.0 .'
                }

            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u huserd -p Erdh1414'

}
                   sh 'docker push huserd/spring-k8-demo:2.0'
                }
            }
        }
        stage('Deploy to k8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'k8sconfigpwd')
                }
            }
        }
    }
}