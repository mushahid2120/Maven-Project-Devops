pipeline {
    tools { 
        maven 'mymaven' 
    }
    agent any
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/mushahid2120/Maven-Project-Devops.git'
            }
        }
        stage('Compile') {
            steps {
                    sh "mvn clean package"
            }
        }
        
        stage('Sonar Scanning') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh "mvn clean verify sonar:sonar -Dsonar.java.binarie=target -Dsonar.java.projectKey=myjenkinssonar"
                    }
            }
        }
        
        stage('Push Artifact') {
            steps {
                    withMaven(globalMavenSettingsConfig: 'my-maven-settings-xml') {
                            sh "mvn deploy"
                    }
            }
        }
        stage('Docker Build') {
            
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'mydocker') {
                        sh "docker build -t mushahid144/java-maven:v1 ."
                    }
                }
            }
        }
        stage('Trivy Scan') {
            steps {
                sh "trivy image mushahid144/java-maven:v1"
            }
        }
        
        stage('Docker Run') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'mydocker') {
                        sh "docker push mushahid144/java-maven:v1"
                    }
                }
            }
        }
        stage('Docker Push') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'mydocker') {
                        sh "docker run -dit -p 80:8080 --name myjavaapp mushahid144/java-maven:v1"
                    }
                }
            }
        }
    }
}
