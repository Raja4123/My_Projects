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
                      -Dsonar.host.url=http://44.210.116.12:9000 \\
                      -Dsonar.login=squ_a46b6947d43a812180415ff94219120d2ddebcea'''
             }
    	 }


    }

}
            
