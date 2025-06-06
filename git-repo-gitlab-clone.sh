#!/bin/bash -xe
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/bit

if [ x$1 == "x" ]; then
  echo "Usage: $0 <git_url>"
  echo "ex: $0 https://github.com/Tianxiaomo/pytorch-YOLOv4 pytorch-YOLOv4.git"
  exit 0
fi

URL=$1
PROJECT=$(basename $1)
GIT_HOME=/home/gitlab

cd $GIT_HOME
git clone --bare --mirror $URL $PROJECT

echo ${PROJECT} >> $GIT_HOME/projects.list
echo $URL > $GIT_HOME/$PROJECT/description
