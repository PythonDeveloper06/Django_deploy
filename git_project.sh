#!/bin/bash

cd $HOME

echo "<------------------------------>"

git_path=""

read -p "Git repository -> " git_path

git clone $git_path

middle_val="$(echo $git_path | awk -F/ '{print $5}')"
dir_path="$(echo $middle_val | awk -F. '{print $1}')"

echo "<------------------------------>"

cd $dir_path
