pipeline{
     agent any
stages{
    stage('Build Docker Image'){
      steps{
        sh "docker build . -t 966145/webapp:${currentBuild.number}"
      }
    }
    stage('Push Image'){
     steps{
       withCredentials([string(credentialsId: 'dpass', variable: 'password')]) {
         sh "docker login -u 966145 -p ${password}"
         sh "docker push 966145/webapp:${currentBuild.number}"
       }
     }
   }
    stage('Deploy to K8s Cluster'){
       steps{
         sh "chmod +x change.sh"
         sh "sh change.sh ${currentBuild.number}"
           sshagent(['ec2-user']) {
           sh "scp -o StrictHostKeyChecking=no new-dep.yaml ec2-user@15.207.249.229:/home/ec2-user/"
          script{
            try{
               sh "ssh  ec2-user@15.207.249.229  kubectl apply -f dep.yaml" 
            }
            catch{
              sh "ssh  ec2-user@15.207.249.229  kubectl create -f dep.yaml"
            }

          }

}

       }

   }


}


}
