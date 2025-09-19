# Deploy llama.cpp-caddy

- references
  - https://documentation.ubuntu.com/server/how-to/graphics/install-nvidia-drivers/
  - https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
- info on llama.cpp
  - https://blog.steelph0enix.dev/posts/llama-cpp-guide/
  - https://www.polarsparc.com/xhtml/Llama-cpp.html
  - https://rlim.com/OXqoE8QG33
  - https://servicestack.net/posts/hosting-llama-server
  - https://www.ahmadosman.com/blog/do-not-use-llama-cpp-or-ollama-on-multi-gpus-setups-use-vllm-or-exllamav2/
- confirm drivers loaded
  ```
  nvidia-smi
  nvtop
  ```
- test server llama_cpp
  ```
  docker run --rm --name llama_cpp --gpus all -p 8000:8000 \
  -v $HOME/.cache/llama.cpp:/root/.cache/llama.cpp ghcr.io/ggml-org/llama.cpp:full-cuda \
  --server --hf-repo ggml-org/gemma-3-1b-it-GGUF \
  --port 8000 --host 0.0.0.0 --log-timestamps --device CUDA0
  ```
- test run llama_cpp
  ```
  docker run --rm --name llama_cpp --gpus all \
  -v $HOME/.cache/llama.cpp:/root/.cache/llama.cpp ghcr.io/ggml-org/llama.cpp:full-cuda \
  --run --hf-repo ggml-org/gemma-3-1b-it-GGUF -p "Building a website can be done in 10 simple steps:" -n 512
  ```
- start llama.cpp
  ```
  cd ~/environment/llama.cpp-caddy
  docker compose up -d
  ```
- download models
  ```
  curl -L -O https://github.com/ggml-org/llama.cpp/releases/download/b6431/llama-b6431-bin-ubuntu-x64.zip
  unzip *.zip
  cd build/bin
  ./llama-cli -hf ggml-org/gemma-3-1b-it-GGUF
  ./llama-bench -m ~/.cache/llama.cpp/ggml-org_gemma-3-1b-it-GGUF_gemma-3-1b-it-Q4_K_M.gguf
  ```
- connect to llama.cpp and execute cli
  ```
  docker exec -it llama.cpp bash
  ```
- verify api
  ```
  curl https://api.sailteam.org/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer from-uuidgen" \
    -d '{
        "model": "ggml-org/gemma-3-1b-it-GGUF",
        "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": "Who won the world series in 2020?"}
        ]
    }'
  ```
