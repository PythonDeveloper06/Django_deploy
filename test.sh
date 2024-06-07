#!/bin/bash

sudo rm -r /home/pavel/DjangoWeb/

sudo rm -r /etc/nginx/sites-available/DjangoWeb
sudo rm -r /etc/nginx/sites-enabled/DjangoWeb

sudo rm -r /etc/systemd/system/gunicorn.service
sudo rm -r /etc/systemd/system/gunicorn.socket

sudo rm -r /var/www/static/
sudo rm -r /var/www/media/

echo "Delete!"