pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            script {
//                 sh "rm -rf Mentorship-Application"
//                 sh "rm -rf Demo"
                sh "ls"
//                 cloneRepository("https://github.com/HuseyinErdogan/Mentorship-Application.git", "master", "github", "Mentorship-Application")
//                 cloneRepository("https://github.com/kedark3/Demo.git", "master", "github", "Demo")
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
void cloneRepository(String url, String branch, String credentialsId, String projectSlug) {
    echo "CLONE REPOSITORY $url"
    sh "git clone --branch $branch $url"
    sh "cp $projectSlug/README.md test/"
    sh "cp -r $projectSlug/docs test/"
    sh "ls -lart ./*"
}
def getProjectInfo(String projectId) {
    echo "GET PROJECT INFO"
    def projectList = readJSON file: 'project-map.json'
    echo "READ JSON"

    for(i=0; i<projectList['projects'].size(); i++)  {
        def project = projectList['projects'][i]
        println("Processing artifact: $project")

//         def providerArtifacts = artifact['providers']
//         def themeArtifacts = artifact['basetheme']
//         def spiArtifacts = artifact['spis']
   }
}
