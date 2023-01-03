pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            script {
                sh "ls"
                cloneRepository("test", "test", "test")
                getProjectInfo("test")
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing.. dev'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
void cloneRepository(String url, String branch, String credentialsId) {
    echo "CLONE REPOSITORY"
    git branch: 'master', credentialsId: 'github', url: 'https://github.com/HuseyinErdogan/Mentorship-Application.git'
    sh "git clone https://github.com/HuseyinErdogan/Mentorship-Application.git"
    sh "ls -lart ./*"
    sh "ls"
}
def getProjectInfo(String projectId) {
    echo "GET PROJECT INFO"
    def projectList = readJSON file: 'project-map.json'

    for(i=0; i<projectList['projects'].size(); i++)  {
        def project = projectList['projects'][i]
        println("Processing artifact: $project")

        def providerArtifacts = artifact['providers']
        def themeArtifacts = artifact['basetheme']
        def spiArtifacts = artifact['spis']
   }
}
