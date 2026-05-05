#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y \
  git \
  awscli \
  python3 \
  python3-pip \
  python3-venv \
  python3-dev \
  default-libmysqlclient-dev \
  build-essential \
  pkg-config

cd /home/ubuntu

TOKEN=$(aws --region us-east-1 ssm get-parameter \
  --name /aydin/capstone/token \
  --with-decryption \
  --query 'Parameter.Value' \
  --output text)

git clone https://${TOKEN}@github.com/AydinTokuslu/aws-capstone-2026.git

chown -R ubuntu:ubuntu /home/ubuntu/aws-capstone-2026

python3 -m venv /opt/capstone-venv
chown -R ubuntu:ubuntu /opt/capstone-venv

sudo -u ubuntu /opt/capstone-venv/bin/pip install --upgrade pip setuptools wheel
sudo -u ubuntu /opt/capstone-venv/bin/pip install -r /home/ubuntu/aws-capstone-2026/requirements.txt
sudo -u ubuntu /opt/capstone-venv/bin/pip install python-decouple crispy-bootstrap4

cd /home/ubuntu/aws-capstone-2026/src

sudo -u ubuntu /opt/capstone-venv/bin/python manage.py check
sudo -u ubuntu /opt/capstone-venv/bin/python manage.py collectstatic --noinput

# Migration'ları ASG içinde her instance tekrar çalıştırmasın diye normalde kapalı tutmak daha doğru.
# İlk kurulumda bir kere manuel/public test instance üzerinden çalıştır.
# sudo -u ubuntu /opt/capstone-venv/bin/python manage.py migrate

sudo /opt/capstone-venv/bin/python manage.py runserver 0.0.0.0:80







#UBUNTU 24.04'E GÖRE
#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y git awscli python3 python3-pip python3-venv python3-dev default-libmysqlclient-dev build-essential pkg-config

cd /home/ubuntu

TOKEN=$(aws --region us-east-1 ssm get-parameter \
  --name /aydin/capstone/token \
  --with-decryption \
  --query 'Parameter.Value' \
  --output text)

git clone https://${TOKEN}@github.com/AydinTokuslu/aws-capstone-2026.git
pip install -r requirements.txt
cd /home/ubuntu/aws-capstone-2026/src

python3 -m venv /opt/capstone-venv
source /opt/capstone-venv/bin/activate

pip install --upgrade pip setuptools wheel
pip install crispy-bootstrap4

python manage.py collectstatic --noinput
python3 manage.py makemigrations
python3 manage.py migrate
python manage.py runserver 0.0.0.0:80


#UBUNTU 22.04'E GÖRE
#!/bin/bash
apt-get update -y
apt-get upgrade -y
apt-get install git -y
apt-get install python3 -y
apt install python3-pip -y
pip3 install boto3
apt install awscli -y
cd /home/ubuntu/
#TOKEN="XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
TOKEN=$(aws --region=us-east-1 ssm get-parameter --name /aydin/capstone/token --with-decryption --query 'Parameter.Value' --output text)
#git clone https://$TOKEN@<YOUR PRIVATE REPO URL>
git clone https://$TOKEN@github.com/AydinTokuslu/aws-capstone-2026.git
#cd /home/ubuntu/<YOUR PRIVATE REPO NAME>
cd /home/ubuntu/aws-capstone-2026
apt-get install python3.10-dev default-libmysqlclient-dev -y
#apt-get install default-libmysqlclient-dev -y
pip3 install -r requirements.txt
cd /home/ubuntu/aws-capstone-2026/src
#cd /home/ubuntu/<YOUR PRIVATE REPO NAME>/src
python3 manage.py collectstatic --noinput
#python3 manage.py makemigrations
#python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:80