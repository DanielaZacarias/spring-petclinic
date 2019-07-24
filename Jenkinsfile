#!groovy

pipeline {
  agent none
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.0'
        }
      }
      steps {
        sh 'mvn clean install'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t danielazacarias/spring-petclinic:latest .'
      }
    }
    
    stage('Docker Run') {
      agent any
      steps {
        sh 'docker run -p 8081:8080 danielazacarias/spring-petclinic'
      }
    }
    
    stage('Docker Push'){
         agent any
          steps {
            withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
            sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
            sh 'docker push danielazacarias/spring-petclinic:latest'
        }
      }

    }
  }
}
