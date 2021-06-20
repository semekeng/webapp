node {
    stage('Git Checkout'){
        git credentialsId: 'jenkinsGitHub', url: 'https://github.com/Technicalcourses2021/webapp.git'
        
    }
    stage('Maven Configuration'){
        def mvnHome = tool name: 'M2_HOME', type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        sh "${mvnCMD} clean install package"
    }
    
}
