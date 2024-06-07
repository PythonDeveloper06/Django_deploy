#!/bin/bash

sudo systemctl stop gunicorn.socket
sudo systemctl stop gunicorn

sudo systemctl stop nginx