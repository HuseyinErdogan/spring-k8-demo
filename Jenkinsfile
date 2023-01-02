pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            script {
                cloneRepository("test", "test", "test")
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/HuseyinErdogan/spring-k8-demo.git'
                sh "ls -lart ./*"
                sh "git checkout dev"
                sh "ls"
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
}



















// @Library("shared-library")_
// pipeline {
//     agent any
//     tools{
//         maven '3.6.3'
//     }
//     stages{
//         stage('Build Maven'){
//             steps{
// //                 checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Java-Techie-jt/devops-automation']]])
//                 helloWorld(name: "Hüseyin", dayOfWeek: "wednesday")
//             }
//         }
//         stage('Build docker image'){
//             steps{
//                 buildImage()
//             }
//         }
// //         stage('Build Maven'){
// //             steps{
// // //                 checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Java-Techie-jt/devops-automation']]])
// //                 sh 'mvn clean install'
// //             }
// //         }
// //         stage('Build docker image'){
// //             steps{
// //                 script{
// //                     sh 'ls '
// //                     sh 'ls target/'
// //                     sh 'docker --version'
// //                     sh 'docker build -t huserd/spring-k8-demo:2.0 .'
// //                 }
// //
// //             }
// //         }
// //         stage('Push image to Hub'){
// //             steps{
// //                 script{
// // //                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
// //                    sh 'docker login -u huserd -p Erdh1414.'
// // //                    }
// //                    sh 'docker pull huserd/spring-k8-demo:2.0'
// //                 }
// //             }
// //         }
// //         stage('Deploy to k8s'){
// //             steps{
// //             withKubeConfig(caCertificate: '''-----BEGIN CERTIFICATE-----
// //             MIIDBjCCAe6gAwIBAgIBATANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwptaW5p
// //             a3ViZUNBMB4XDTIyMDkxMzIxMDgyMVoXDTMyMDkxMTIxMDgyMVowFTETMBEGA1UE
// //             AxMKbWluaWt1YmVDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAN1w
// //             oQT/dqDWLrQbsDxLznvKBVbNoa+92YeAmCRQgDQASLWmk6rGg3XJj3jx8N13gfbS
// //             JSvFthZ+zD63G2sTfyFHEKZz3q5geDiuWGpP/cyoNAcDZ1UjbXow1oe5Mdwr+5Ey
// //             xMamQ4WE1L/bTYcaIv3QkK9aUPETNNaDo4q8lAA4tZ3kKIQpYyHB6u8QHtNBxD2C
// //             yQzpz32lbrPZXB8w3+1bTkagDH3368weWpQcFwQVYIzvdFYSnWH9o6A8L3lzAzhU
// //             oP20RbnHYRGs78aTFGy9VKPWV4jyDi/CXZa2OrNA7hOR694jrX9QXQL62zyo7bMT
// //             nFz8KJNwUINBSaj4lIUCAwEAAaNhMF8wDgYDVR0PAQH/BAQDAgKkMB0GA1UdJQQW
// //             MBQGCCsGAQUFBwMCBggrBgEFBQcDATAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQW
// //             BBS+E4QurkxfN1UcG9BkP/60J47GsjANBgkqhkiG9w0BAQsFAAOCAQEAgBkE9O73
// //             DqinNuCubOH/i6kpmm+MVbyz6MK2j44JPX3Vh+XemXOyGaAnmf+K3cqPDI7uHkhK
// //             Xq+1o5CtQWFY9CKUZU185Cp5DaN274HwsvdxHKhczH38gCsFuUve1MBUrWTYS6Rv
// //             s5FXqHXucwFyAx5AoQQc7vd9l+7Dge/lfgXRoLO+lgedkRbxrq7riQh8BN4e3Q6l
// //             bco9aEqWpPHGCk51mxX2GGxwFvix/TIsDL3Yw6lzBHrRb4AVyDXYdjfNjNHT1xji
// //             Wof05iOZ/k4vgftlCYl1shF/GbMop0G3dkXZbwMwF5sV1d2Rs7ru9vC+Ji67f3BY
// //             6Pf56nItFvvMhg==
// //             -----END CERTIFICATE-----''', clusterName: 'minikube', contextName: 'minikube', credentialsId: 'a506f8b0-40b1-4118-996c-7ada387419db', namespace: 'default', serverUrl: 'https://192.168.49.2:8443') {
// //                 sh 'kubectl apply -f deploymentservice.yaml'
// //             }
// // //                 script{
// // //                 kubeconfig(caCertificate: '''-----BEGIN CERTIFICATE-----
// // //                 MIIDBjCCAe6gAwIBAgIBATANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwptaW5p
// // //                 a3ViZUNBMB4XDTIyMDkxMzIxMDgyMVoXDTMyMDkxMTIxMDgyMVowFTETMBEGA1UE
// // //                 AxMKbWluaWt1YmVDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAN1w
// // //                 oQT/dqDWLrQbsDxLznvKBVbNoa+92YeAmCRQgDQASLWmk6rGg3XJj3jx8N13gfbS
// // //                 JSvFthZ+zD63G2sTfyFHEKZz3q5geDiuWGpP/cyoNAcDZ1UjbXow1oe5Mdwr+5Ey
// // //                 xMamQ4WE1L/bTYcaIv3QkK9aUPETNNaDo4q8lAA4tZ3kKIQpYyHB6u8QHtNBxD2C
// // //                 yQzpz32lbrPZXB8w3+1bTkagDH3368weWpQcFwQVYIzvdFYSnWH9o6A8L3lzAzhU
// // //                 oP20RbnHYRGs78aTFGy9VKPWV4jyDi/CXZa2OrNA7hOR694jrX9QXQL62zyo7bMT
// // //                 nFz8KJNwUINBSaj4lIUCAwEAAaNhMF8wDgYDVR0PAQH/BAQDAgKkMB0GA1UdJQQW
// // //                 MBQGCCsGAQUFBwMCBggrBgEFBQcDATAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQW
// // //                 BBS+E4QurkxfN1UcG9BkP/60J47GsjANBgkqhkiG9w0BAQsFAAOCAQEAgBkE9O73
// // //                 DqinNuCubOH/i6kpmm+MVbyz6MK2j44JPX3Vh+XemXOyGaAnmf+K3cqPDI7uHkhK
// // //                 Xq+1o5CtQWFY9CKUZU185Cp5DaN274HwsvdxHKhczH38gCsFuUve1MBUrWTYS6Rv
// // //                 s5FXqHXucwFyAx5AoQQc7vd9l+7Dge/lfgXRoLO+lgedkRbxrq7riQh8BN4e3Q6l
// // //                 bco9aEqWpPHGCk51mxX2GGxwFvix/TIsDL3Yw6lzBHrRb4AVyDXYdjfNjNHT1xji
// // //                 Wof05iOZ/k4vgftlCYl1shF/GbMop0G3dkXZbwMwF5sV1d2Rs7ru9vC+Ji67f3BY
// // //                 6Pf56nItFvvMhg==
// // //                 -----END CERTIFICATE-----''', credentialsId: 'a506f8b0-40b1-4118-996c-7ada387419db', serverUrl: 'https://192.168.49.2:8443') {
// // //                     // some block
// // //                 }
// // //                     kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'kubernetes')
// // //                 }
// //             }
// //         }
//     }
// }
