import java.text.SimpleDateFormat

pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps{
                build job: 'remote-pipeline', parameters: [
                    string(name: 'project_id', value: '1389'), booleanParam(name: 'is_remote_trigger', value: false))
                ]
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}