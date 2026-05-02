
#UBUNTU 24.04'E GÖRE
#!/bin/bash
apt-get update -y
apt-get upgrade -y
apt-get install git -y
apt-get install -y python3 python3-pip python3-venv python3-dev

python3 -m venv /opt/appenv
source /opt/appenv/bin/activate
pip install --upgrade pip
pip3 install boto3
apt install awscli -y
cd /home/ubuntu/
#TOKEN="XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
TOKEN=$(aws --region=us-east-1 ssm get-parameter --name /aydin/capstone/token --with-decryption --query 'Parameter.Value' --output text)
#git clone https://$TOKEN@<YOUR PRIVATE REPO URL>
git clone https://$TOKEN@github.com/AydinTokuslu/aws-capstone-2026.git
#cd /home/ubuntu/<YOUR PRIVATE REPO NAME>
cd /home/ubuntu/aws-capstone-2026
apt-get install -y python3 python3-pip python3-venv python3-dev default-libmysqlclient-dev build-essential pkg-config
pip install -r requirements.txt
cd /home/ubuntu/aws-capstone-2026/src

python3 -m venv /opt/capstone-venv
source /opt/capstone-venv/bin/activate

pip install --upgrade pip setuptools wheel

python manage.py collectstatic --noinput
# python manage.py makemigrations
# python manage.py migrate

python manage.py runserver 0.0.0.0:80




apt-get install python3.12-dev default-libmysqlclient-dev -y
#apt-get install default-libmysqlclient-dev -y
pip3 install -r requirements.txt
cd /home/ubuntu/aws-capstone-2026/src
#cd /home/ubuntu/<YOUR PRIVATE REPO NAME>/src
python3 manage.py collectstatic --noinput
#python3 manage.py makemigrations
#python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:80


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


#!/bin/bash
apt-get update -y
apt-get upgrade -y
apt-get install git -y
apt-get install python3 -y
apt install python3-pip -y
pip3 install boto3
apt install awscli -y
cd /home/ubuntu/
TOKEN="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
git clone https://$TOKEN@<YOUR PRIVATE REPO URL>
cd /home/ubuntu/<YOUR PRIVATE REPO NAME>
apt install python3-pip -y
apt-get install python3.7-dev default-libmysqlclient-dev -y
pip3 install -r requirements.txt
cd /home/ubuntu/<YOUR PRIVATE REPO NAME>/src
python3 manage.py collectstatic --noinput
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:80