pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            script {
                sh "rm -rf Mentorship-Application"
                sh "rm -rf Demo"
                sh "ls"
                def project = getProjectById("123")
                println("Project Name: ${project.name}")
//                 createMergeRequest();
                addDocuments(project)
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
void addDocuments(def project) {
    sh "git checkout -f -b my-new-branc3"

    println("cloning ${project.url} repository")
    sh "git clone --branch ${project.branch} ${project.url}"

    println("creating directory ${project.destination_path}/${project.slug}")
    sh "mkdir -p ${project.destination_path}/${project.slug}"
    sh "mkdir -p ${project.destination_path}/${project.slug}"

    sh "cp ${project.slug}/README.md ${project.destination_path}/${project.slug}/"

    sh "cp -r ${project.slug}/docs ${project.destination_path}/${project.slug}/"
    println("documents added to ${project.destination_path}/${project.slug}")

    sh "ls ${project.destination_path}/${project.slug}/"

    println("deleting the cloned repository ${project.slug}")
    sh "rm -rf ${project.slug}"

    sh "git add . "
    sh 'git commit -m \\"My commit message\\"'
    sh 'git status'
    sh "git push origin my-new-branc3"


}
def getProjectById(String projectId) {
    echo "GET PROJECT INFO"
    def projectList = readJSON file: 'project-map.json'
    echo "READ JSON"

    for(i=0; i<projectList['projects'].size(); i++)  {
        def project = projectList['projects'][i]
//         println("Processing artifact: $project")
        if(project.id==projectId){
//             projectList['projects'][i]["version"]="132"
//             writeJSON file: 'project-map.json', json: projectList
//             sh "cat project-map.json"
            return project
        }
   }
   return null;
}

