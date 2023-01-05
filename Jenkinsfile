import java.text.SimpleDateFormat

pipeline {
    agent any

    stages {
        makeStage().call()
        stage('Checkout') {
            steps {
            script {
                sh "ls"
                sh "rm -rf plateau-iam"
                def project = getProjectById("422")
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
    def branch = "${project.slug}-mr-at-${timestamp}"

//     sh "git config --global user.email \"huseyinerdoganhe@outlook.com\""
//     sh "git config --global user.name \"Huseyin\""


    sh "git checkout -f -b ${branch}"

    println("Created branch name: ${branch}")

    println("cloning ${project.url} repository")
    sh "git clone --branch ${project.branch} ${project.url}"

    sh "cd ${project.slug}"
    sh "git diff HEAD^"
    sh "cd .."

    sh "git status"

    println("creating directory docs/${project.destination_path}/${project.slug}")
    sh "mkdir -p docs/${project.destination_path}/${project.slug}"
    if(project.id.equals("422")){ //checks if its identity provider project
        addBaseImageDocuments(project)
    }else{
        sh "cp ${project.slug}/README.md docs/${project.destination_path}/${project.slug}/"
        sh "cp -r ${project.slug}/docs docs/${project.destination_path}/${project.slug}/"
        println("documents added to docs/${project.destination_path}/${project.slug}")
    }

    println("deleting the cloned repository ${project.slug}")
    sh "rm -rf ${project.slug}"

    sh "git add . "
    sh "git commit -m \"${project.name} documentation has been added to docs/${project.destination_path}\""
    sh "git status"
    sh "git push -u origin ${branch} \
          -o merge_request.create \
          -o merge_request.title=\"${project.name} Documentation Merge Request\" \
          -o merge_request.description=\"This MR is created for adding the documents of the ${project.name} project.\" \
          -o merge_request.target=master \
          -o merge_request.remove_source_branch"

}
def getProjectById(String projectId) {
    def projectList = readJSON file: 'project-map.json'

    for(i=0; i<projectList['projects'].size(); i++)  {
        def project = projectList['projects'][i]
        if(project.id.equals(projectId)){
            return project
        }
   }
   return null;
}

void addBaseImageDocuments(def project){
    def baseImages = []
    dir(project.slug) {
       def files = findFiles()
       files.each{ f ->
          if(f.directory) {
            if(f.name ==~ '([0-9]+).([0-9]+).([0-9]+)'){
                baseImages.add(f.name)
            }
          }
       }
    }
    for(baseImage in baseImages){
        sh "mkdir -p docs/${project.destination_path}/${baseImage}"
        sh "cp ${project.slug}/${baseImage}/README.md docs/${project.destination_path}/${baseImage}/"
        println("Base image ${baseImage} document has been added")
        sh "ls docs/${project.destination_path}/${baseImage}/"
    }
}
def makeStage = {
  return {
    stage('a') {
      echo 'Hello World'
    }
  }
}