  # Deploy vllm-caddy

- references
  - https://docs.vllm.ai/en/stable/deployment/docker.html
  - https://blog.brianbaldock.net/deploying-local-ai-inference-with-vllm-and-chatui-in-docker
- install nvidia drivers 550
  - https://documentation.ubuntu.com/server/how-to/graphics/install-nvidia-drivers/
  ```
  sudo ubuntu-drivers install --gpgpu
  sudo apt install nvidia-driver-575-server-open
  ```
- install container toolkit
  - https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
  ```
  sudo docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi
  ```
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