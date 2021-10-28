pipeline{
     agent any
stages{
    stage('Build Docker Image'){
      steps{
        sh "docker build . -t 966145/webapp:v1"
      }
    }
    stage('Push Image'){
     steps{
       withCredentials([string(credentialsId: 'dpass', variable: 'password')]) {
         sh "docker login -u 966145 -p ${password}"
         sh "docker push 966145/webapp:v1"
       }
     }
   }


}


}
