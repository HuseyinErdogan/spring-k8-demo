pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            script {
//                 sh "rm -rf Mentorship-Application"
//                 sh "rm -rf Demo"
                sh "ls"
                def project = getProjectById("123")
                println("Project Name: ${project.project_name}")
                cloneRepository(project)
//                 cloneRepository("https://github.com/kedark3/Demo.git", "master", "github", "Demo")

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
void cloneRepository(def project) {
    echo "CLONE REPOSITORY ${project.project_url}"
    sh "git clone --branch ${project.branch} ${project.project_url}"
    sh "cp ${project.project_slug}/README.md test/"
    sh "cp -r ${project.project_slug}/docs test/"
    sh "ls -lart ./*"
}
def getProjectById(String projectId) {
    echo "GET PROJECT INFO"
    def projectList = readJSON file: 'project-map.json'
    echo "READ JSON"

    for(i=0; i<projectList['projects'].size(); i++)  {
        def project = projectList['projects'][i]
        println("Processing artifact: $project")
        if(project.project_id==projectId){
            return project
        }
   }
   return null;
}
