sudo yum install epel-release -y
sudo yum install fontconfig java-17-openjdk -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo --no-check-certificate
sudo rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install jenkins -y

sudo vi /lib/systemd/system/jenkins.service

systemctl start jenkins
systemctl status jenkins
systemctl enable jenkins
systemctl cat jenkins
