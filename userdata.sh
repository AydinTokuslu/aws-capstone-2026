#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y \
  git \
  curl \
  unzip \
  python3 \
  python3-pip \
  python3-venv \
  python3-full \
  python3-dev \
  default-libmysqlclient-dev \
  build-essential \
  pkg-config

# AWS CLI v2 install
cd /tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
./aws/install

cd /home/ubuntu

# Repo public ise token gerekmez:
git clone https://github.com/AydinTokuslu/aws-capstone-2026.git

chown -R ubuntu:ubuntu /home/ubuntu/aws-capstone-2026

rm -rf /opt/capstone-venv
python3 -m venv /opt/capstone-venv

/opt/capstone-venv/bin/python -m ensurepip --upgrade
/opt/capstone-venv/bin/python -m pip install --upgrade pip setuptools wheel
/opt/capstone-venv/bin/python -m pip install -r /home/ubuntu/aws-capstone-2026/requirements.txt
/opt/capstone-venv/bin/python -m pip install python-decouple crispy-bootstrap4

cd /home/ubuntu/aws-capstone-2026/src

/opt/capstone-venv/bin/python manage.py check
/opt/capstone-venv/bin/python manage.py collectstatic --noinput

# Migration sadece ilk kurulumda bir kez çalıştırılmalı.
# /opt/capstone-venv/bin/python manage.py migrate

/opt/capstone-venv/bin/python manage.py runserver 0.0.0.0:80