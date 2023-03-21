pipeline{
        environment{
        DOCKERHUB_CREDENTIALS = credentials('Dockercred')
	}

    agent any
    stages{
        stage("Git clone"){
            steps{
              git branch: 'master', url: 'https://github.com/sachin978/Spe_miniProject.git'
            }
        }
        stage('Maven Build'){
            steps{
                echo 'Job Build'
                sh "mvn clean install"
            }
        }
        stage("Building our Image"){
            steps{
                script{
                    echo "Building dockerimage"
                    sh 'docker build -t sachin978/scientific_calc .'
                }
            }
        }
         stage('Login into DockerHub') {
              steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push to DockerHub') {
              steps {
                sh 'docker push sachin978/scientific_calc'
            }
        }
        stage('Delete Docker Image from Local'){
                steps {
                    sh 'docker rmi sachin978/scientific_calc'
            }
        }
        stage("Ansible Deploy"){
            steps{
                    sh "ansible-playbook -i inventory plybk.yml"
            }
        }
    }

}