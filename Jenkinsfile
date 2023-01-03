pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            script {
                sh "rmdir -f Mentorship-Application"
                sh "ls"
                cloneRepository("https://github.com/HuseyinErdogan/Mentorship-Application.git", "master", "github")
                cloneRepository("https://github.com/kedark3/Demo.git", "master", "github")
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
    echo "CLONE REPOSITORY $url"
//     git url: url, branch: branch, credentialsId: credentialsId
    sh "git clone --branch $branch $url"
    sh "ls -lart ./*"
    sh "ls"
//     sh "cp Mentorship-Application/README.md test/*"
}
def getProjectInfo(String projectId) {
    echo "GET PROJECT INFO"
    def projectList = readJSON file: 'project-map.json'

    for(i=0; i<projectList['projects'].size(); i++)  {
        def project = projectList['projects'][i]
        println("Processing artifact: $project")

//         def providerArtifacts = artifact['providers']
//         def themeArtifacts = artifact['basetheme']
//         def spiArtifacts = artifact['spis']
   }
}
