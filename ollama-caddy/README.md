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
  