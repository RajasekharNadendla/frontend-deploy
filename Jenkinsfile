pipeline{
    agent {
        label 'AGENT-1'
    }
    options{
        timeout(time: 30 , unit: 'MINUTES')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    environment{
        def appVersion = ''
        nexusUrl= 'nexus.rajasekhar.store:8081'
    }
    parameters {
        string(name: 'appVersion', defaultValue: '1.0.0', description: 'What is App version?')
    }
    stages{
         stage('Print the version'){
            steps{
                sh """
                    echo " App version is: ${params.appVersion}"
                """
            }
        }
        stage('Init'){
            steps{
                sh """
                    cd terraform 
                    terraform init
                """
            }
        }
        stage('plan'){
            steps{
                sh """
                    cd terraform 
                    terraform plan -var="app_version=${params.appVersion}"
                """
            }
        }
        stage('deploy'){
            steps{
                sh """
                    cd terraform 
                    terraform apply -auto-approve -var="app_version=${params.appVersion}"
                """
            }
        }
        
    }
    post{
        always{
            echo 'I will run always'
            deleteDir()
        }
        failure { 
            echo 'I will run when the build failed!'
        }
        success { 
            echo 'I will run when build is success!'
        }
    }

}