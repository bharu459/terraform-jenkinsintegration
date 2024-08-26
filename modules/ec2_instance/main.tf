resource "aws_instance" "jenkins_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name
  

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
                          https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
              echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
                     https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
                     /etc/apt/sources.list.d/jenkins.list > /dev/null
              sudo apt-get update
              sudo apt-get install jenkins
            EOF

  tags = {
    Name = "Jenkins-Server"
  }
}
