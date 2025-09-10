  # Deploy vllm-caddy

- references
  - https://docs.vllm.ai/en/stable/deployment/docker.html
  - https://blog.brianbaldock.net/deploying-local-ai-inference-with-vllm-and-chatui-in-docker
  - https://ploomber.io/blog/vllm-deploy/
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
    docker run --runtime nvidia --gpus all \
    -v ~/.cache/huggingface:/root/.cache/huggingface \
    -p 23333:23333 \
    --ipc=host \
    openmmlab/lmdeploy:latest \
    lmdeploy serve api_server Qwen/Qwen3-0.6B    
  ```
- bug in Triton library
  ```
  #https://github.com/unslothai/unsloth/issues/2491#issuecomment-3141648812
  uv pip install -U "triton>=3.4.0"

  vllm serve Qwen/Qwen3-0.6B --dtype float16 --gpu-memory-utilization 0.8 --max-model-len=3264 --max-num-batched-tokens=3264

  docker build . \
    -t vllm-gpu-image \
    --build-arg max_jobs=8 --build-arg nvcc_threads=2 \
    --file docker/Dockerfile
  ```