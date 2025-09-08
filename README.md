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

# Deploy ollama-caddy

- references
  - https://ollama.com/blog/ollama-is-now-available-as-an-official-docker-image
  - https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
- configure service tokens
  - https://developers.cloudflare.com/cloudflare-one/identity/service-tokens/
  - https://caddy.community/t/using-caddy-to-secure-port/30064/8
- confirm drivers loaded
  ```
  nvidia-smi
  ```
- start ollama
  ```
  cd ~/environment/ollama-caddy
  docker compose up -d
  ```
- connect to ollama
  ```
  docker exec -it ollama bash
  ollama pull llama3.2:3b
  ollama run llama3.2:3b
  ```
  
  # Deploy vllm-caddy

- references
  - https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
  - https://docs.vllm.ai/en/stable/deployment/docker.html
  - https://blog.brianbaldock.net/deploying-local-ai-inference-with-vllm-and-chatui-in-docker
- confirm drivers loaded
  ```
  nvidia-smi
  ```
- start vllm
  ```
  cd ~/environment/vllm-caddy
  docker compose up -d
  ```
- confirm operation
  ```
  curl https://api.sailteam.org/v1/chat/completions \
    -H 'Authorization: Bearer from-uuidgen' \
    -H "Content-Type: application/json" \
    -d '{
        "model": "Qwen/Qwen3-0.6B",
        "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": "Who won the world series in 2020?"}
        ]
    }'

  ```
- connect to vllm
  ```
  ```
- load models
  ```
  ```

# jupyter notebook
- references
  - https://medium.com/@sabaybiometzger/docker-container-with-jupyter-notebook-and-remote-access-f7cec701fb30
