#!/bin/bash

cd $HOME

git_repo=""

read -p "Name your git repo -> " git_repo

cd $git_repo

python3 manage.py collectstatic
sudo cp -r media/ /var/www/
sudo mv -r static/ /var/www/

rm -r $git_repo/dev_settings.py

echo "Django configured!"

