#!/bin/bash -xe

if [ x$1 == "x" ]; then
  echo "Usage: $0 <project_name>"
  echo "ex: $0 mic-730ai-jetpack-5.1.2"
  exit 0
fi

PROJECT=$1

if [ ! -d /home/git/${PROJECT}.git ]; then
  echo "Project $PROJECT doesn't exist"
  exit 0
fi

rm -rf /home/git/${PROJECT}.git

sed -i "s/${PROJECT}.git//" /home/git/projects.list
