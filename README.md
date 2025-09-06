# Install base environment

- references
  - https://docs.docker.com/engine/install/ubuntu/
- pull environment
  ```
  cd ~
  git clone https://github.com/winmill/environment.git
  cd environment/base
  ```
- update .env with cloudflare tunnel key
- modify ports
- apply ports
  ```
  bash ./environment.sh
  ```
- fix & restart sshd
  ```
  sudo vi /etc/ssh/sshd_config
  ```
  - PasswordAuthentication no
  ```
  sudo systemctl restart sshd.service
  ```
- start tunnel and portainer
  ```
  docker compose up -d
  ```
  - verify tunnel at cloudflare
  - set portainer password

# Deploy hummingbot dashboard

- references
  - 
- pull environment
  ```
  cd ~
  git clone https://github.com/hummingbot/deploy.git
  cd deploy
  ```
- set credentials for user
- enable credentials (AUTH_SYSTEM_ENABLED)
- modify ports (as above)
- start hummingbot
  ```
  bash setup.sh
  ```

# Deploy n8n

- references 
  - https://www.hostinger.com/tutorials/how-to-self-host-n8n-with-docker
- modify ports (as above)
- start n8n
  ```
  cd ~/environment/n8n
  docker compose up -d
  ```

# Deploy ollama

- references
  - https://ollama.com/blog/ollama-is-now-available-as-an-official-docker-image
  - https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
- confirm drivers loaded
  ```
  nvidia-smi
  ```
- start ollama
  ```
  cd ~/environment/ollama
  docker compose up -d
  ```
- connect to ollama
  ```
  docker exec -it ollama bash
  ollama pull llama3.2:3b
  ollama run llama3.2:3b
  ```

# Deploy ollama-bearer-auth

- references
  - https://github.com/bartolli/ollama-bearer-auth-caddy
- confirm drivers loaded
  ```
  nvidia-smi
  ```
- build
  ```
  git clone https://github.com/bartolli/ollama-bearer-auth-caddy.git
  cd ~/ollama-bearer-auth-caddy
  ```
- replace keys in Caddy/valid_keys.conf
  ```
  echo "sk-ollama-$(openssl rand -hex 16)"
  ```
- build per README
  ```
  docker build -t <your_username>/<image_name>:<tag> .
  ```
- replace `docker-compose.yml`
- start ollama
  ```
  docker compose up -d
  curl -i http://localhost:8081 -H "Authorization: Bearer correct_api_key"
  ```
- connect to ollama (as above)
  