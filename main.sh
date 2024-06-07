#!/bin/bash

sudo chmod +x  ~/django_deploy/restart.sh ~/django_deploy/start.sh ~/django_deploy/stop.sh ~/django_deploy/global_restart.sh
sudo chmod +x ~/django_deploy/vr_env.sh ~/django_deploy/git_project.sh ~/django_deploy/manage.sh 

sudo sudo chmod +x ~/django_deploy/lib.sh

. ~/django_deploy/lib.sh
~/django_deploy/start.sh