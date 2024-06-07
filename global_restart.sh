#!/bin/bash

sudo systemctl stop gunicorn.socket
sudo systemctl stop gunicorn

sudo systemctl stop nginx

#<---------->

sudo systemctl enable gunicorn.socket
sudo systemctl enable gunicorn
sudo systemctl start gunicorn.socket
sudo systemctl start gunicorn

sudo service nginx start