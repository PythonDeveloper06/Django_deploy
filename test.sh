#!/bin/bash

sudo rm -r /home/pavel/Djangoweb/

sudo rm -r /etc/nginx/sites-available/DjangoWeb
sudo rm -r /etc/nginx/sites-enabled/DjangoWeb

sudo rm -r /etc/systemd/system/gunicorn.service
sudo rm -r /etc/systemd/system/gunicorn.socket

echo "Delete!"