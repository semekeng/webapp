node{
    stage('Git Checkout'){
    git credentialsId: 'dd463d46-1d59-46b9-b92b-35f98c49815c', url: 'https://github.com/Sudheerkumarthota/webapp.git'
    }
    stage('Maven Configuration'){
        def mvnHome = tool name: 'M2_HOME', type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        sh "${mvnCMD} clean install package"
    }
    stage('Build Docker Image'){
        sh 'docker build -t sudheer10thota/webapp:1.0.0 .'
    }
	stage('Push Docker Image'){
	    withCredentials([string(credentialsId: 'docker-hub-pwd', variable: 'dockerHubPwd')]) {
	        sh "docker login -u sudheer10thota -p ${dockerHubPwd}"
        }
	    sh 'docker push sudheer10thota/webapp:1.0.0'
    }
    stage('Run Container on dev Server'){
        sh 'docker run -d -p 8003:8080 sudheer10thota/webapp:1.0.0'
          
	}
    //stage('Run Docker container on remote hosts'){
    //    def dockerRun = 'docker run -p 9091:9091 -d --name my-app sudheer10thota/webapp:1.0.0'
    //    sshagent(['dev-server2']) {
    //       sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.17.184 ${dockerRun}"
    //} 
    //} 	 
}



