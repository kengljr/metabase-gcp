#!/bin/bash
set -e

sleep 10

apt-get update -y
apt-get install -y docker.io docker-compose

systemctl start docker
systemctl enable docker

# inject compose จาก Terraform
cat <<'EOF' > /home/ubuntu/docker-compose.yml
${compose}
EOF

cd /home/ubuntu
docker-compose --env-file .env up -d