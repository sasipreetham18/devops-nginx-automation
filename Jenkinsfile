pipeline {
    agent any

    environment {
        ANSIBLE_DIR = "ansible"
        PLAYBOOK = "nginx-playbook.yml"
        HOSTS_FILE = "hosts"
    }

    stages {
        stage('Clone Repo') {
            steps {
                echo "Cloning the repo..."
                checkout scm
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                dir("${ANSIBLE_DIR}") {
                    echo "Running Ansible Playbook..."
                    sh "ansible-playbook -i ${HOSTS_FILE} ${PLAYBOOK}"
                }
            }
        }

        stage('Verify Nginx') {
            steps {
                echo "Checking if Nginx is running..."
                sh "curl -I http://localhost | grep '200 OK' || echo 'Nginx not responding!'"
            }
        }
    }

    post {
        success {
            echo "✅ Nginx setup complete!"
        }
        failure {
            echo "❌ Pipeline failed. Check errors."
        }
    }
}

