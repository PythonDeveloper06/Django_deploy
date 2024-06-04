#!/bin/bash

home_dir=$HOME
cd $home_dir

echo "<------------------------------>"

git_path=""

read -p "Git repository -> " git_path

git clone $git_path

middle_val="$(echo $git_path | awk -F/ '{print $5}')"
dir_path="$(echo $middle_val | awk -F. '{print $1}')"

cd $dir_path

echo "<------------------------------>"

python3 -m venv venv
source venv/bin/activate
pip install -U pip
pip install -r requirements.txt

echo "<------------------------------>"

project_path="${HOME}/${dir_path}"

sed -i "s~path_to_project~$project_path~g" ~/django_deploy/nginx/DjangoWeb ~/django_deploy/systemd/gunicorn.service

sudo cp ~/django_deploy/systemd/gunicorn.service /etc/systemd/system/
sudo cp ~/django_deploy/systemd/gunicorn.socket /etc/systemd/system/

sudo cp ~/django_deploy/nginx/DjangoWeb /etc/nginx/sites-available/

sudo ln -s /etc/nginx/sites-available/DjangoWeb /etc/nginx/sites-enabled/

systemd-analyze verify /etc/systemd/system/gunicorn.service

sudo nginx -t

echo "<------------------------------>"