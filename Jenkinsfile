import java.text.SimpleDateFormat

pipeline {
    agent any

    stages {
//         stage('Checkout') {
//             steps{
//                 build job: 'remote-pipeline', parameters: [
//                     string(name: 'project_id', value: '1389'), string(name: 'version', value: sh(returnStdout: true, script: "cat build.gradle | grep -o 'version = [^,]*'").trim().split(/=/)[1])
//                 ]
//             }
//         }
        stage('Test') {
            steps {
                script{
                    def version_value = sh(returnStdout: true, script: "cat build.gradle | grep -o 'version = [^,]*'").trim()
                    println(version_value)
                    println(version_value.getClass())
                    def arr = version_value.split('\n')
                    String splitVersion;
                    for(a in arr){
                        println("AAA:"+a)
                        splitVersion = a.split(/=/)[1].trim()
                        println(splitVersion)
                        if(splitVersion ==~ "(/d+)/.(/d+)/.(/d+)*"){
                            println("Version found: "+splitVersion)
                        }
                    }

                    println("TESTTTTTTTTTTT")
                    def version = version_value.split(/=/)[1]
                    sh "echo final version: $version"
//                     def file = readFile "README.md"
//                     file = file.replaceFirst("[\\\r\\\n]+", "\nTEST\n")
//                     println("WRITE README")
//                     writeFile file: "README.md", text: file
//                     sh 'cat README.md'
//                     def f = new File('README.md')
//                     def lines = f.readLines()
//                     lines = lines.plus(1, "I'm a new line!")
//                     f.text = lines.join('\n')
//                     def output = sh returnStdout: true, script: 'git status --porcelain'
//                     if(output.isEmpty()){
//                         println("TESTSETS")
//                     }
//                     println("Status: ${output}")
//                     def project = getProjectById("422")
//                     println("Project Name: ${project.name}")
//                     addDocuments(project)
                }
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

// def getVersion() {
//     def version_value =
//     return version_value
// }
