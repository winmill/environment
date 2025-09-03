# Install base environment

- references
  - https://docs.docker.com/engine/install/ubuntu/
- pull environment
  - *cd ~*
  - *git clone https://github.com/winmill/environment.git*
  - *cd base*
- update .env with cloudflared key
- modify ports
  - *bash ./environment.sh*
- fix & restart sshd
  - *sudo vi /etc/ssh/sshd_config*
    - PasswordAuthentication no
  - *sudo systemctl restart sshd.service*
- start tunnel and portainer
  - *docker compose up -d*
  - verify tunnel at cloudflare
  - set portainer password

# Deploy hummingbot

- pull environment
  - *cd ~*
  - *git clone https://github.com/hummingbot/deploy.git*
- set credentials for user
- modify ports (as above)
- start hummingbot
  - *bash setup.sh*

# Deploy n8n

- references 
  - https://www.hostinger.com/tutorials/how-to-self-host-n8n-with-docker
- modify ports (as above)
- go to directory
  - *cd ~/n8n*
- start n8n
  - *docker compose up -d*

# Deploy ollama

- references
  - https://ollama.com/blog/ollama-is-now-available-as-an-official-docker-image
  - https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
- 