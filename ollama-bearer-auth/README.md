# Deploy ollama-bearer-auth

- references
  - https://github.com/bartolli/ollama-bearer-auth-caddy
  - https://medium.com/@spandanmaity58/authenticate-ollama-server-with-caddy-reverse-proxy-7c619e213ced
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
  docker build -t winmill/ollama-bearer-auth-caddy:1 .
  ```
- replace `docker-compose.yml`
- start ollama
  ```
  docker compose up -d
  curl -i http://localhost:8081 -H "Authorization: Bearer correct_api_key"
  ```
- connect to ollama (as above)
  
