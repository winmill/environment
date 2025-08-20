#! /bin/bash
#sudo ufw allow 2001/tcp
#sudo ufw allow 2002/tcp
sudo ufw allow 9443/tcp
sudo ufw reload
sudo ufw status verbose