# Install base environment

- references
  - https://docs.docker.com/engine/install/ubuntu/
  - https://packetpushers.net/blog/ubuntu-extend-your-default-lvm-space/
  - https://documentation.ubuntu.com/server/how-to/software/automatic-updates/
  - https://www.kolide.com/features/checks/ubuntu-unattended-upgrades
- expand drive
  ```
  df -h
  sudo lvdisplay
  sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
  sudo lvdisplay
  sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
  df -h
  ```
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
- enable automated updates
  ```
  sudo apt-get install unattended-upgrades -y
  sudo dpkg-reconfigure -plow unattended-upgrades
  ```
- start tunnel and portainer
  ```
  docker compose up -d
  ```
  - verify tunnel at cloudflare
  - set portainer password