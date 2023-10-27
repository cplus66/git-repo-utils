#!/bin/bash -xe

if [ x$1 == "x" ]; then
  echo "Usage: $0 <project_name> [descriptio]"
  echo "ex: $0 mic-730ai-jetpack-5.1.2 'MIC-730AI JetPack 5.1.2 BSP'"
  exit 0
fi

PROJECT=$1

if [ -d /home/git/${PROJECT}.git ]; then
  echo "Project $PROJECT exists"
  exit 0
fi

mkdir /home/git/${PROJECT}.git
cd /home/git/${PROJECT}.git
git init --bare

chown -R git.git /home/git/${PROJECT}.git

echo ${PROJECT}.git >> /home/git/projects.list

if [ "x$2" != "x" ]; then
  echo $2 > /home/git/${PROJECT}.git/description
fi
