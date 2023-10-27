#!/bin/bash -xe

if [ x$1 == "x" ]; then
  echo "Usage: $0 <git_url>"
  echo "ex: $0 https://github.com/Tianxiaomo/pytorch-YOLOv4 pytorch-YOLOv4.git"
  exit 0
fi

# git clone --bare https://github.com/Tianxiaomo/pytorch-YOLOv4 pytorch-YOLOv4.git
URL=$1
PROJECT=$(basename $1)

git clone --bare $URL $PROJECT

echo ${PROJECT} >> /home/git/projects.list
