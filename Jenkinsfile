pipeline {
    agent any

    environment {
        // Set up AWS credentials as environment variables
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')     // Jenkins credentials ID for AWS Access Key
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key') // Jenkins credentials ID for AWS Secret Key
    }

    stages {
        stage('Initialize Terraform') {
            steps {
                script {
                    // Run Terraform initialization
                    sh 'terraform init'
                }
            }
        }
        
        stage('Validate Terraform') {
            steps {
                script {
                    // Validate Terraform configuration files
                    sh 'terraform validate'
                }
            }
        }
        
        stage('Plan Terraform') {
            steps {
                script {
                    // Generate and save the Terraform execution plan
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                script {
                    // Apply the Terraform plan to create resources
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            echo 'Terraform pipeline completed.'
        }
        success {
            echo 'Terraform applied successfully!'
        }
        failure {
            echo 'Terraform pipeline failed.'
        }
    }
}
