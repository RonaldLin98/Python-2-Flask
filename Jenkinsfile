pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'pip install -r requirements.txt'
                sh 'docker build -t registry.example.com/flask-app-python2:$BUILD_NUMBER .'
            }
        }

        stage('Push to Registry') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-registry', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'docker login -u $DOCKER_USER -p $DOCKER_PASS registry.example.com'
                    sh 'docker push registry.example.com/flask-app-python2:$BUILD_NUMBER'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                withKubeConfig([credentialsId: 'kube-config']) {
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }
}
