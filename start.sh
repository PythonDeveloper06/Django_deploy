#!/bin/bash

sudo systemctl enable gunicorn.socket
sudo systemctl enable gunicorn
sudo systemctl start gunicorn.socket
sudo systemctl start gunicorn

sudo service nginx start