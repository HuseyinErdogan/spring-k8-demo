import java.text.SimpleDateFormat

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            script {
                sh "ls"
                def project = getProjectById("123")
//                 addBaseImageDocuments(project)
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
    def dateFormat = new SimpleDateFormat("yyyy.MM.dd-HH.mm.ss")
    def date = new Date()
    def timestamp = dateFormat.format(date)
    println timestamp
    def branch = "${project.slug}-mr-at-${timestamp}"
    sh "git checkout -f -b ${branch}"

    sh "git status"

    println("cloning ${project.url} repository")
    sh "git clone --branch ${project.branch} ${project.url}"

    println("creating directory ${project.destination_path}/${project.slug}")
    sh "mkdir -p ${project.destination_path}/${project.slug}"

    sh "cp ${project.slug}/README.md ${project.destination_path}/${project.slug}/"

    sh "cp -r ${project.slug}/docs ${project.destination_path}/${project.slug}/"
    println("documents added to ${project.destination_path}/${project.slug}")

    sh "ls ${project.destination_path}/${project.slug}/"

    dir('${project.slug}') {
       def files = findFiles()

       files.each{ f ->
          if(f.directory) {
            echo "This is directory: ${f.name} "
          }
       }
    }
    println("deleting the cloned repository ${project.slug}")
    sh "rm -rf ${project.slug}"



    sh "git add . "
    sh 'git commit -m \\"My commit message\\"'
    sh 'git status'
    sh "git push origin ${branch}"


}
def getProjectById(String projectId) {
    echo "GET PROJECT INFO"
    def projectList = readJSON file: 'project-map.json'

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

// void addBaseImageDocuments(def project){
//     ==~ '([0-9]+).([0-9]+).([0-9]+)'
// }
