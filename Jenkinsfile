pipeline {
    agent any


       tools {
        maven 'maven3'
       }

    stages {
      stage('checkout') {
            steps {
                echo 'Cloning GIT HUB Repo '
				git branch: 'main', url: 'https://github.com/Raja4123/First-pipeline.git'
            }  
        }
		
		
		
	 stage('sonar') {
            steps {
                echo 'scanning project'
                sh 'ls -ltr'
                
                sh ''' mvn sonar:sonar \\
                      -Dsonar.host.url=http://65.1.110.36:9000 \\
                      -Dsonar.login=b2e10bb0207d9969f1cd897662c26d35fdb21002'''
             }
    	 }


    }

}
            
