node {
    stage('Git Checkout'){
        git credentialsId: 'jenkinsGitHub', url: 'https://github.com/Technicalcourses2021/webapp.git'
        
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
        withCredentials([string(credentialsId: 'dockerHPwd', variable: 'dockerHubPwd')]) {
            sh "docker login -u sudheer10thota -p ${dockerHubPwd}"
            }
	    sh 'docker push sudheer10thota/webapp:1.0.0'
    }
    stage('Run on jenkins Server'){
        sh 'docker run -d -p 8003:8080 sudheer10thota/webapp:1.0.0'
          
	}
    
}
