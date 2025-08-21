#! /bin/bash
# whoami
# sudo ufw allow 2001/tcp
# portainer
sudo ufw allow 9443/tcp
# dashboard
sudo ufw allow 8501/tcp
# API
#sudo ufw allow 8000/tcp
# PostgresSQL
#sudo ufw allow 5432/tcp
# EMQX dashboard
#sudo ufw allow 18083/tcp
sudo ufw reload
sudo ufw status verbose

# manual steps
# sudo vi /etc/ssh/sshd_config
#   PasswordAuthentication no
# sudo systemctl restart sshd.service