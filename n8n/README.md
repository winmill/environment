# Deploy n8n

- references 
  - https://www.hostinger.com/tutorials/how-to-self-host-n8n-with-docker
- allow port 
  ```
  sudo ufw allow 5678/tcp
  sudo ufw reload
  sudo ufw status
  ```
- create data directory
  ```
  cd ~/environment/n8n
  mkdir n8n_data
  sudo chown -R 1000:1000 n8n_data
  ```
- start n8n
  ```
  docker compose up -d
  ```