pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checkout the code from SCM..'
                git credentialsId: 'd3ecfca7-a5a5-4eae-a773-9019a94ff9e0', url: 'https://github.com/ravikiranmaroju/2021-AWS-DOCS.git'
            }
        }
        stage('Prepare') {
            steps {
                echo 'Prepared Succesfully..'
            }
        }
        stage('Compile') {
            steps {
                echo 'Compiled Succesfully..'
            }
        }
        stage('Build') {
            steps {
                echo 'Building..'
                sh "mvn package"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('QA') {
            steps {
                echo 'QA..'
            }
        }
        stage('UnitTesting') {
            steps {
                echo 'Unit Testing is in Progress..'
            }
        }
        stage('Monitor') {
            steps {
                echo 'Monitoring..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh "cp -r /var/lib/jenkins/workspace/dev-pipeline/target/*war /opt/tomcat/webapps/"
            }
        }
    }
}
