#!/bin/bash

#<-----переход в домашнюю директорию----->
cd $HOME

echo "<------------------------------>"

#<-----клонирование git репозитория----->

git_path=""

read -p "Git repository -> " git_path

echo "<------------------------------>"

git clone $git_path

#<-----переход в папку проекта----->

middle_val="$(echo $git_path | awk -F/ '{print $5}')"
dir_path="$(echo $middle_val | awk -F. '{print $1}')"

cd $dir_path

echo "<------------------------------>"

#<-----активация виртуального окружения и установка зависимостей----->

python3 -m venv venv
source venv/bin/activate
pip install -U pip
pip install -r requirements.txt

echo "<------------------------------>"

#<-----cбор static и media файлов в /var/www/----->

python3 manage.py collectstatic
sudo cp -r media/ /var/www/
sudo mv static/ /var/www/

rm -r $dir_path/dev_settings.py

echo "Django configured!"

echo "<------------------------------>"

#<-----настройка conf-файлов, перенос их в нужные места и проверка на правильность----->

project_path="${HOME}/${dir_path}"

sudo cp ~/Django_deploy/systemd/gunicorn.service /etc/systemd/system/
sudo cp ~/Django_deploy/systemd/gunicorn.socket /etc/systemd/system/

sudo cp ~/Django_deploy/nginx/DjangoWeb /etc/nginx/sites-available/

sudo sed -i "s~path_to_project~$project_path~g" /etc/nginx/sites-available/DjangoWeb /etc/systemd/system/gunicorn.service

sudo ln -s /etc/nginx/sites-available/DjangoWeb /etc/nginx/sites-enabled/

systemd-analyze verify /etc/systemd/system/gunicorn.service

sudo nginx -t

echo "<------------------------------>"