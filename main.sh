#!/bin/bash

sudo chmod +x  ~/Django_deploy/restart.sh ~/Django_deploy/start.sh ~/Django_deploy/stop.sh ~/Django_deploy/global_restart.sh
sudo chmod +x ~/Django_deploy/vr_env.sh ~/Django_deploy/git_project.sh ~/Django_deploy/manage.sh 

sudo sudo chmod +x ~/Django_deploy/lib.sh

. ~/Django_deploy/lib.sh
~/Django_deploy/start.sh